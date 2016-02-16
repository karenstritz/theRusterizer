import maya.cmds as cmds
import os, sys

#rusterizer class
class rusterizerClass(object):
	use = None;
	@classmethod
	def showUI(cls,uiFile):
		win=cls(uiFile);
		win.create();
		return win;
	def __init__(self):
		rusterizerClass.use=self;
		self.window='rusterizerWindow';
		self.uiFile=os.environ['RUSTERIZERPATH']+'/rusterizer.ui'
	def create(self, verbose=False):
		if cmds.window(self.window, exists=True):
			cmds.deleteUI(self.window);
		self.window=cmds.loadUI(
			uiFile=self.uiFile,
			verbose=verbose
		);
		cmds.showWindow(self.window);
	def closeWindow():
		cmds.deleteUI(qtWin)

	def browse(self):
		browsefilepath = cmds.fileDialog2(fm=1, cap = 'Rust Distribution Map Browser', okc='Set as Map')
		cmds.textField("mapName", e=1, text=str(browsefilepath[0]))

	def browse2(self):
		browse2filepath = cmds.fileDialog2(fm=3, cap = 'Shader Path Browser', okc='Set as Path')
		cmds.textField("shaderPath", e=1, text=str(browse2filepath[0]))

	def browse3(self):
		browse3filepath = cmds.fileDialog2(fm=3, cap = 'Output Path Browser', okc='Set as Path')
		cmds.textField("outPath", e=1, text=str(browse3filepath[0]))

	def browse4(self):
		browse4filepath = cmds.fileDialog2(fm=1, cap = 'Rust Probability Map Browser', okc='Set as Map')
		cmds.textField("probMapName", e=1, text=str(browse4filepath[0]))

	def rusterize(self):
		# set string from "mapName" text field to mapName
		mapName = cmds.textField("mapName", query = True, text = True)
		# set string from "shaderPath" text field to shaderPath
		cellShaderPath = cmds.textField("shaderPath", query = True, text = True)
		# set string from "outPath" text field to outPath
		outputPath = cmds.textField("outPath", query = True, text= True)
		# set resolution to value from resValue
		resolution = cmds.optionMenu("resValue", query = True, value= True)
		# set start to value from startFrame
		frameBegin = cmds.textField("startFrameValue", query = True, text = True) 
		# set end to value from endFrame
		frameEnd = cmds.textField("endFrameValue", query = True, text = True)
		# set string from "probMapName" text field to probMapName
		probMapName = cmds.textField("probMapName", query = True, text = True)

		rusterizerpath=os.environ["RUSTERIZERPATH"]
		os.system("cd "+ rusterizerpath)
		percent = os.system("python "+ rusterizerpath+"/rusterizer.py "+mapName+" "+cellShaderPath+" "+outputPath+" "+resolution+" "+frameBegin+" "+frameEnd+" "+probMapName)

	def help(self):
		os.system("chromium-browser http://wiki.fx.clemson.edu/mediawiki/index.php/DPA_Tools:rusterizer &")