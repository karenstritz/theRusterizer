#THE RUSTERIZER
#Created by Karen Stritzinger
#1/30/2014
#-------------------------------------------------
import prman
import os
import sys
import dpapipetools as dpa
import DPAfs
from dpaCreateFS import *
import datetime


#command line arguments---------------------------

#name of painted rust distribution .tex file 
mapName = sys.argv[1]

#path of current cellular.sl shader (this shader name is hard coded below)
cellShaderPath = "@:"+sys.argv[2]

#output path for tex and ptc files
outputPath = sys.argv[3]

#cellular automata simulation resolution
resolution = sys.argv[4]

#frame range input
frameBegin = sys.argv[5]
frameEnd = sys.argv[6]

#name of painted rust probability .tex file
probMapName = ""
if (len(sys.argv) > 7):
	probMapName = sys.argv[7]


#--------------------------------------------------
frameNumber = int(frameEnd)-int(frameBegin)

texOutputPath = outputPath+"/tex/"
ptcOutputPath = outputPath+"/ptc/"

fspattern = dpaCreateFSPattern(outputPath)
fs = DPAfs.evaluateFSString(fspattern)

def upcaseFirstLetter(s):
    return s[0].upper() + s[1:]

#output stage pulled from path
outputStage = fs["stage"] 

#output version pulled from path
outputShot = upcaseFirstLetter(fs["shot"])

#output asset name pulled from path
outputAssetName = upcaseFirstLetter(fs["assetName"])

#output version pulled from path
outputVersion = fs["version"]

def percentReturn(percent):	
	#print "percent returned"
	return percent


#stageShotAsset-Version
shaderName = "cellular"


# create an instance of the RenderMan interface
ri = prman.Ri() 

#should be equal to start frame
#initValue = 1.0
initValue = float(frameBegin)

formatValue = int(resolution)

#This assumes that the beginning frame is always 1. If a segfault occurs and you were to restart the simulation at that frame, 
#this will allow the increment to stay consistent. 
ageIncrement = (1.0/float(frameEnd))*5.0

#For frame 1-frameNumber, shade a surface using cellular.sl and output a corresponding rib, ptc, and tex file.  
#Set frame padding based on frame number argument.
for i in range(int(frameBegin),(int(frameEnd)+1)):
	#current time
	curr = datetime.datetime.now()
	print "Start"
	print curr
	paddedFrame = dpa.DpaPipeFormattedFrame(i)

	#rendertarget = "cellular."+framePadding+str(i)+".rib"
	ri.Begin(ri.RENDER) # set rendertarget to ri.RENDER to render pixels
	ri.Option("searchpath", {"shader":cellShaderPath+"/"})
	ri.DisplayChannel("float _cellLife")
	ri.DisplayChannel("float _cellAge")
	ri.Display(texOutputPath+outputStage+outputShot+outputAssetName+"-"+outputVersion+"."+paddedFrame+".tex", "texture", "rgba")
	ri.Format(formatValue,formatValue,1)
	ri.Projection(ri.ORTHOGRAPHIC) # standard Ri tokens are available
	ri.ShadingRate(1)
	ri.Translate(0,0,3)
	ri.Rotate(-90,1,0,0)
	ri.Rotate(0,0,1,0)
	ri.Scale(1,1,-1)
	ri.WorldBegin()
	ri.Attribute(ri.DICE, {ri.RASTERORIENT: 0})#{"dice", "rasterorient", 0}) # view-independent dicing
	ri.Surface(shaderName,{
		"float init": initValue,
		"float count": float(resolution),
		"float ageIncrement": ageIncrement,
		"string oldcell": str(ptcOutputPath)+"old.ptc", # note "./"
		"string newcell": str(ptcOutputPath)+"new.ptc",
		"string mapname": mapName,
		"string probMapName": probMapName})
	#initValue -= (1.0/float(frameEnd))
	initValue += 1.0
	ri.AttributeBegin()
	#ri.Scale(2, 2, 2)
	ri.Polygon({ri.P: [-1.0, 0.0, -1.0,  -1.0, 0.0, 1.0,  1.0, 0.0, 1.0,  1.0, 0.0, -1.0],
		"st": [0.0, 0.0,  0.0, 1.0,  1.0, 1.0,  1.0, 0.0]})
	ri.AttributeEnd()
	ri.WorldEnd()

	
	print "Generated organized point cloud."
	ri.System("ptfilter -organize 1 "+ptcOutputPath+"new.ptc "+ptcOutputPath+"new.ptc")
	ri.System("mv "+ptcOutputPath+"new.ptc "+ptcOutputPath+"old.ptc")

	#print "mv new.ptc old.ptc complete"
	ri.System("cp "+ptcOutputPath+"old.ptc "+ptcOutputPath+outputStage+outputShot+outputAssetName+"-"+outputVersion+"."+paddedFrame+".ptc")
	print "Frame # "+paddedFrame
	#ri.System("rm "+ptcOutputPath+"new.ptc")
	#check to see that bake3d variable name matches display channels
	ri.End()
	percent = 100.0*(float(i)/float(frameEnd))
	percentReturn(percent)
	print str(int(percent))+"% Complete, Current Time: " 
	curr = datetime.datetime.now()
	print curr
