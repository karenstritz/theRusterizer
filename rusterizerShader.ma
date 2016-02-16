//Maya ASCII 2013 scene
//Name: rusterizerShader.ma
//Last modified: Sat, Feb 01, 2014 01:01:03 PM
//Codeset: UTF-8
requires maya "2013";
requires "RenderMan_for_Maya" "5.0";
requires "stereoCamera" "10.0";
currentUnit -linear centimeter -angle degree -time film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2013";
fileInfo "version" "2013 x64";
fileInfo "cutIdentifier" "201209210317-845513";
fileInfo "osv" "Linux 3.2.0-58-generic #88-Ubuntu SMP Tue Dec 3 17:37:58 UTC 2013 x86_64";
fileInfo "license" "education";
createNode RenderManShader -name "Rusterizer_Surface";
	addAttr -cachedInternally true -usedAsColor -keyable true -shortName "rman__riattr___Opacity" 
		-longName "rman__riattr___Opacity" -attributeType "float3" -numberOfChildren 3;
	addAttr -cachedInternally true -keyable true -shortName "rman__riattr___Opacityr" 
		-longName "rman__riattr___OpacityR" -defaultValue -1 -attributeType "float" -parent "rman__riattr___Opacity";
	addAttr -cachedInternally true -keyable true -shortName "rman__riattr___Opacityg" 
		-longName "rman__riattr___OpacityG" -defaultValue -1 -attributeType "float" -parent "rman__riattr___Opacity";
	addAttr -cachedInternally true -keyable true -shortName "rman__riattr___Opacityb" 
		-longName "rman__riattr___OpacityB" -defaultValue -1 -attributeType "float" -parent "rman__riattr___Opacity";
	addAttr -cachedInternally true -usedAsColor -keyable true -shortName "rman__riattr___Color" 
		-longName "rman__riattr___Color" -attributeType "float3" -numberOfChildren 3;
	addAttr -cachedInternally true -keyable true -shortName "rman__riattr___Colorr" 
		-longName "rman__riattr___ColorR" -defaultValue -1 -attributeType "float" -parent "rman__riattr___Color";
	addAttr -cachedInternally true -keyable true -shortName "rman__riattr___Colorg" 
		-longName "rman__riattr___ColorG" -defaultValue -1 -attributeType "float" -parent "rman__riattr___Color";
	addAttr -cachedInternally true -keyable true -shortName "rman__riattr___Colorb" 
		-longName "rman__riattr___ColorB" -defaultValue -1 -attributeType "float" -parent "rman__riattr___Color";
	addAttr -cachedInternally true -hidden true -shortName "rman__riattr__photon_shadingmodel" 
		-longName "rman__riattr__photon_shadingmodel" -dataType "string";
	addAttr -cachedInternally true -keyable true -shortName "rusterizerOutputPath" -longName "rusterizerOutputPath" 
		-dataType "string";
	addAttr -cachedInternally true -keyable true -shortName "rusterizerOutputBaseFilename" 
		-longName "rusterizerOutputBaseFilename" -dataType "string";
	addAttr -cachedInternally true -keyable true -shortName "range" -longName "range" 
		-defaultValue 0.11400000005960464 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "rustType" -longName "rustType" 
		-defaultValue 1 -minValue 1 -maxValue 4 -enumName "Type A=1:Type B:Type C:Type D" 
		-attributeType "enum";
	addAttr -cachedInternally true -keyable true -shortName "gammaVal" -longName "gammaVal" 
		-defaultValue 0.4544999897480011 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "roughness" -longName "roughness" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "age" -longName "age" -defaultValue 
		3 -softMinValue 0 -softMaxValue 1000 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "maxLife" -longName "maxLife" 
		-defaultValue 3 -softMinValue 0 -softMaxValue 1000 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseLevel" -longName "noiseLevel" 
		-defaultValue 4 -softMinValue 2 -softMaxValue 6 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "bumpPaintScale" -longName "bumpPaintScale" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 10 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "rustBumpNoiseDepth" -longName "rustBumpNoiseDepth" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "rustBumpNoiseFreq" -longName "rustBumpNoiseFreq" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 100 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "Kd" -longName "Kd" -defaultValue 
		1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "Ka" -longName "Ka" -defaultValue 
		1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -usedAsColor -keyable true -shortName "specularColor" 
		-longName "specularColor" -attributeType "float3" -numberOfChildren 3;
	addAttr -cachedInternally true -keyable true -shortName "specularColorr" -longName "specularColorR" 
		-defaultValue 1 -attributeType "float" -parent "specularColor";
	addAttr -cachedInternally true -keyable true -shortName "specularColorg" -longName "specularColorG" 
		-defaultValue 1 -attributeType "float" -parent "specularColor";
	addAttr -cachedInternally true -keyable true -shortName "specularColorb" -longName "specularColorB" 
		-defaultValue 1 -attributeType "float" -parent "specularColor";
	addAttr -cachedInternally true -keyable true -shortName "rustSpec" -longName "rustSpec" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 10 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "paintSpec" -longName "paintSpec" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 10 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseScaleA" -longName "noiseScaleA" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseFreqA" -longName "noiseFreqA" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseScaleB" -longName "noiseScaleB" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 10 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseFreqB" -longName "noiseFreqB" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseScaleC" -longName "noiseScaleC" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 10 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseFreqC" -longName "noiseFreqC" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseScaleD" -longName "noiseScaleD" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 100 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseFreqD" -longName "noiseFreqD" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseScaleE" -longName "noiseScaleE" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 100 -attributeType "float";
	addAttr -cachedInternally true -keyable true -shortName "noiseFreqE" -longName "noiseFreqE" 
		-defaultValue 1 -softMinValue 0 -softMaxValue 1 -attributeType "float";
	setAttr ".caching" yes;
	setAttr ".shadername" -type "string" "/DPA/moosefs/2013KarenThesis/lookdev/share/surface/rust/prman/0009/rust.slo";
	setAttr ".shaderinterface" -type "string" "string rusterizerOutputPath -default {/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/}\nstring rusterizerOutputBaseFilename -default {stageShotAsset-Version}\nfloat range -default {0.114}\nfloat rustType -default {1}\nfloat gammaVal -default {0.4545}\nfloat roughness -default {1}\nfloat age -default {3}\nfloat maxLife -default {3}\nfloat noiseLevel -default {4}\nfloat bumpPaintScale -default {1}\nfloat rustBumpNoiseDepth -default {1}\nfloat rustBumpNoiseFreq -default {1}\nfloat Kd -default {1}\nfloat Ka -default {1}\ncolor specularColor -default {1  1  1}\nfloat rustSpec -default {1}\nfloat paintSpec -default {1}\nfloat noiseScaleA -default {1}\nfloat noiseFreqA -default {1}\nfloat noiseScaleB -default {1}\nfloat noiseFreqB -default {1}\nfloat noiseScaleC -default {1}\nfloat noiseFreqC -default {1}\nfloat noiseScaleD -default {1}\nfloat noiseFreqD -default {1}\nfloat noiseScaleE -default {1}\nfloat noiseFreqE -default {1}\n";
	setAttr -keyable on ".rman__riattr___Opacity" -type "float3" 1 1 1 ;
	setAttr -keyable on ".rman__riattr___Color" -type "float3" 0.28859624 0.28280202 0.29800001 ;
	setAttr ".rman__riattr__photon_shadingmodel" -type "string" "matte";
	setAttr -keyable on ".rusterizerOutputPath" -type "string" "/DPA/moosefs/2013KarenThesis/lookdev/share/assets/cellularAutomataSimulation/0010/256x256/tex/";
	setAttr -keyable on ".rusterizerOutputBaseFilename" -type "string" "lookdevShareCellularAutomataSimulation-0010";
	setAttr -keyable on ".gammaVal" 0.45500001311302185;
	setAttr -keyable on ".roughness" 0.21500000357627869;
	setAttr -alteredValue -keyable on ".age" 0;
	setAttr -keyable on ".maxLife" 200;
	setAttr -keyable on ".noiseLevel" 6;
	setAttr -keyable on ".bumpPaintScale" 1.2000000476837158;
	setAttr -keyable on ".rustBumpNoiseFreq" 50;
	setAttr -keyable on ".Kd" 0.37599998712539673;
	setAttr -keyable on ".rustSpec" 3;
	setAttr -keyable on ".paintSpec" 10;
	setAttr -keyable on ".noiseScaleA" 0.80000001192092896;
	setAttr -keyable on ".noiseScaleB" 5;
	setAttr -keyable on ".noiseScaleC" 10;
	setAttr -keyable on ".noiseScaleD" 18;
	setAttr -keyable on ".noiseScaleE" 25;
createNode animCurveTU -name "Rusterizer_Surface_age";
	setAttr ".tangentType" 18;
	setAttr ".weightedTangents" no;
	setAttr -size 3 ".keyTimeValue[0:2]"  1 0 176 0 200 200;
createNode partition -name "mtorPartition";
	addAttr -cachedInternally true -shortName "rgcnx" -longName "rgcnx" -attributeType "message";
	addAttr -cachedInternally true -shortName "sd" -longName "slimData" -dataType "string";
	addAttr -cachedInternally true -shortName "sr" -longName "slimRIB" -dataType "string";
	addAttr -cachedInternally true -shortName "rd" -longName "rlfData" -dataType "string";
	setAttr ".slimData" -type "string" (
		"#\n# generated by slim for kmstrit at Mon Jan 13 10:43:31 AM EST 2014\n#\nslim 2 TOR slim {\npalette 00000K3C_98iLrbK {\n  label {untitled 2}\n  state open\n  display {}\n  saveicons attachable\n  iconres 60\n  function 00000a3C_98qqxbK {\n    label PtexColor\n    state open\n    master {$slimShaders/tmp/${NAMESPACE}$INSTANCENAME}\n    modified 1381954768\n    progenitor {template pixar,PtexColor#0}\n    properties {\n      fields {\n        File {\n          value /DPA/moosefs/2013KarenThesis/lookdev/share/assets/testSphere/0001/hi/ptx/assetsTestSphere.ptx\n        }\n      }\n    }\n    dependencies 00000a3C_9OrqxbK\n  }\n  function 00000a3C_9OrqxbK {\n    label GPSurface_0\n    state open\n    master {$slimShaders/${NAMESPACE}$INSTANCENAME}\n    modified 1381954792\n    progenitor {template pixar,RMSGPSurface#0}\n    properties {\n      fields {\n        surfaceColor {\n          provider connection\n        }\n      }\n      connections {\n        surfaceColor {00000a3C_98qqxbK average}\n      }\n    }\n    dependencies 00000a3C_98qqxbK\n  }\n  function 00000K3C_9erL2cK {\n"
		+ "    label Fractal\n    state open\n    master {$slimShaders/tmp/${NAMESPACE}$INSTANCENAME}\n    modified 1382061668\n    progenitor {template pixar,C_Fractal#0}\n    properties {\n      fields {\n        Layers {\n          value 7\n        }\n        Frequency {\n          value 2.89\n        }\n        Dimension {\n          value 0.95\n        }\n        Erosion {\n          value -2.00\n        }\n        Variation {\n          value 0.21\n        }\n      }\n    }\n  }\n  function 00000K3C_9ecM2cK {\n    label PtexColor_0\n    state open\n    master {$slimShaders/tmp/${NAMESPACE}$INSTANCENAME}\n    modified 1382062320\n    progenitor {template pixar,PtexColor#0}\n    properties {\n      fields {\n        File {\n          value /DPA/moosefs/2013KarenThesis/lookdev/share/assets/testSphere/0001/hi/ptx/assetsTestSphere.ptx\n        }\n        DefaultColor {\n          description {Color to return in place of a missing map.}\n        }\n        AlphaOp {\n          value nop\n        }\n        outputAlpha {\n          value 0\n        }\n        ColorBalance {\n"
		+ "          state open\n        }\n        Advanced {\n          state open\n        }\n      }\n    }\n    dependencies 00000K3C_9ejM2cK\n  }\n  function 00000K3C_9ejM2cK {\n    label GPSurface_1\n    state open\n    creator {\n      appearanceid 00000K3C_9ejM2cK\n      container {slim internal palette}\n      containerid 00000K3C_98iLrbK\n      filename untitled\n      label {untitled 2}\n      session /DPA/moosefs/2013KarenThesis/lookdev/share/surface/slimPtexTest/maya/0001/surfaceSlimptextest-0001.ma\n      timestamp 1382061808\n      translator slim\n      workspace /DPA/moosefs/2013KarenThesis/lookdev/share/surface/slimPtexTest/maya/0001/RMSworkspace.ws\n    }\n    master {$slimShaders/${NAMESPACE}$INSTANCENAME}\n    modified 1382062320\n    progenitor {template pixar,RMSGPSurface#0}\n    properties {\n      fields {\n        surfaceColor {\n          provider connection\n        }\n      }\n      connections {\n        surfaceColor {00000K3C_9ecM2cK result}\n      }\n    }\n    dependencies 00000K3C_9ecM2cK\n  }\n  function 00000K3C_98cI6cK {\n"
		+ "    label PtexColor_1\n    state open\n    master {$slimShaders/tmp/${NAMESPACE}$INSTANCENAME}\n    modified 1382126232\n    progenitor {template pixar,PtexColor#0}\n    properties {\n      fields {\n        File {\n          value /DPA/moosefs/2013KarenThesis/lookdev/share/assets/testSphere/0001/hi/ptx/assetsTestSphere.ptx\n        }\n        ColorBalance {\n          state open\n        }\n        Advanced {\n          state open\n        }\n      }\n    }\n    dependencies 00000K3C_98kJ6cK\n  }\n  function 00000K3C_9OhJ6cK {\n    label AllPurpose\n    state open\n    creator {\n      appearanceid 00000K3C_9OhJ6cK\n      container {slim internal palette}\n      containerid 00000K3C_98iLrbK\n      filename untitled\n      label {untitled 2}\n      session /DPA/moosefs/2013KarenThesis/lookdev/share/surface/slimPtexTest/maya/0001/surfaceSlimptextest-0001.ma\n      timestamp 1382126548\n      translator slim\n      workspace /DPA/moosefs/2013KarenThesis/lookdev/share/surface/slimPtexTest/maya/0001/RMSworkspace.ws\n    }\n    master {$slimShaders/${NAMESPACE}$INSTANCENAME}\n"
		+ "    modified 1382126548\n    progenitor {template pixar,allPurpose#0}\n    properties {\n      fields {\n        layer1_v1 {\n          state open\n        }\n      }\n      connections {\n        layer1_v1 {00000K3C_98kJ6cK result}\n      }\n    }\n    dependencies 00000K3C_98kJ6cK\n  }\n  function 00000K3C_98kJ6cK {\n    label Diffuse_3\n    state open\n    drawmode inline\n    master {$slimShaders/tmp/${NAMESPACE}$INSTANCENAME}\n    modified 1382126548\n    progenitor {template pixar,apsc_Diffuse#0}\n    properties {\n      fields {\n        Color {\n          provider connection\n        }\n      }\n      connections {\n        Color {00000K3C_98cI6cK result}\n      }\n    }\n    dependencies {00000K3C_98cI6cK 00000K3C_9OhJ6cK}\n  }\n  hierarchy {\n    00000a3C_98qqxbK {}\n    00000a3C_9OrqxbK {}\n    00000K3C_9erL2cK {}\n    00000K3C_9ecM2cK {}\n    00000K3C_9ejM2cK {}\n    00000K3C_98cI6cK {}\n    00000K3C_9OhJ6cK {\n      00000K3C_98kJ6cK {}\n    }\n  }\n  graphlayouts {\n    layout GPSurface_layout {\n      arrangemethod auto\n      traversemethod upstream\n"
		+ "      roots 00000K3C_9OhJ6cK\n      traversemethod upstream\n      scroll {0.265941406227 0.259547743719}\n      transforms {0.876234748711 {-340.982376769 -257.915362186}}\n    }\n    layout PtexColor_layout {\n      arrangemethod auto\n      traversemethod upstream\n      roots 00000a3C_9OrqxbK\n      traversemethod upstream\n      scroll {0.268029752788 0.260869624938}\n      transforms {1 {0 0}}\n    }\n    layout PtexColor_0_layout {\n      arrangemethod auto\n      traversemethod upstream\n      roots {00000K3C_9ejM2cK 00000K3C_9erL2cK}\n      traversemethod upstream\n      scroll {0.284530196133 0.260869624938}\n      transforms {1 {0 0}}\n    }\n  }\n}\n}\n");
	setAttr ".slimRIB" -type "string" "";
select -noExpand :time1;
	setAttr ".outTime" 176;
	setAttr ".unwarpedTime" 176;
select -noExpand :renderPartition;
	setAttr -size 9 ".sets";
select -noExpand :initialShadingGroup;
	setAttr ".renderableOnlySet" yes;
select -noExpand :initialParticleSE;
	setAttr ".renderableOnlySet" yes;
select -noExpand :defaultShaderList1;
	setAttr -size 6 ".shaders";
select -noExpand :defaultTextureList1;
	setAttr -size 2 ".textures";
select -noExpand :lightList1;
select -noExpand :postProcessList1;
	setAttr -size 2 ".postProcesses";
select -noExpand :defaultRenderUtilityList1;
	setAttr -size 2 ".utilities";
select -noExpand :defaultRenderingList1;
select -noExpand :renderGlobalsList1;
select -noExpand :initialMaterialInfo;
select -noExpand :defaultRenderGlobals;
	setAttr ".currentRenderer" -type "string" "renderMan";
	setAttr ".imageFormat" 51;
	setAttr ".imfPluginKey" -type "string" "exr";
	setAttr ".animation" yes;
	setAttr ".endFrame" 150;
	setAttr ".extensionPadding" 4;
	setAttr ".putFrameBeforeExt" yes;
	setAttr ".imageFilePrefix" -type "string" "";
	setAttr ".colorProfileEnabled" yes;
select -noExpand :defaultResolution;
	setAttr ".width" 1920;
	setAttr ".height" 1080;
	setAttr ".pixelAspect" 1;
	setAttr ".deviceAspectRatio" 1.7777777910232544;
select -noExpand :defaultLightSet;
select -noExpand :defaultViewColorManager;
	setAttr ".imageColorProfile" 2;
select -noExpand :hardwareRenderGlobals;
	setAttr ".colorTextureResolution" 256;
	setAttr ".bumpTextureResolution" 512;
select -noExpand :hardwareRenderingGlobals;
	setAttr ".objectTypeFilterNameArray" -type "stringArray" 16 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Viewport UI"  ;
	setAttr ".objectTypeFilterValueArray" -type "Int32Array" 16 1 1 1
		 1 1 1 1 1 1 1 1 1 1 1 1
		 1 ;
	setAttr ".colorBakeResolution" 4096;
select -noExpand :defaultHardwareRenderGlobals;
	setAttr ".filename" -type "string" "im";
	setAttr ".resolution" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "Rusterizer_Surface_age.output" "Rusterizer_Surface.age";
connectAttr ":defaultRenderGlobals.message" "mtorPartition.rgcnx";
connectAttr "Rusterizer_Surface.message" ":defaultShaderList1.shaders" -nextAvailable
		;
// End of rusterizerShader.ma
