/*
<meta id= "slim"><![CDATA[
slim 1 appearance slim {
	instance surface rust rust {
	collection void cellularcollection {
		state open
		label "Rusterizer"
		parameter string rusterizerOutputPath {
			label "Output Path"
			default "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/"
		}
		parameter string rusterizerOutputBaseFilename {
			label "Output Base Filename"
			default "stageShotAsset-Version"
		}
		parameter float uOffset {
			label "Texture Patch U Offset"
			default 0.0
		}
		parameter float vOffset {
			label "Texture Patch V Offset"
			default 0.0
		}
		parameter float mapExport {
			label "Map Export Mode"
			subtype selector
			range {
				"Off" 1
				"Diffuse" 2
				"Specular" 3
				"Bump" 4
			}
			default 1
		}
	}
	collection void maincollection {
		state open
		label "Main"

		parameter string diffuseMapName {
			label "Base Diffuse Map"
			default "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/stageShotAsset-Version.ext"
		}

		parameter string bumpMapName {
			label "Base Bump Map"
			default "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/stageShotAsset-Version.ext"
		}
		parameter string specMapName {
			label "Base Spec Map"
			default "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/stageShotAsset-Version.ext"
		}

		parameter float age {
			label "Age of Rust"
			default 3.0
		}

		parameter float maxLife {
			label "Max Life"
			default 3.0
		}

		parameter float noiseLevel {
			label "Number of Noise Layers"
			default 4.0
			range { 2 6 1.0 }
		}

		parameter float overallScale {
			label "Overall Scale"
			default 1.0
		}

		parameter float gammaVal {
			label "Color Gamma"
			default .4545
		}

		parameter float roughness {
			label "Roughness"
			default 1.0
		}

		parameter float Kd {
			label "Overall Diffuse"
			default 1.0
		}

		parameter float Ka {
			label "Overall Ambient"
			default 1.0
		}
		parameter color specularColor {
			label "Overall Specular Color"
			default { 1.0 1.0 1.0 }
		}

		parameter float rustSpec {
			label "Rust Specular Gain"
			default 1.0
		}

		parameter float rustBumpNoiseDepth {
			label "Rust Bump Amount"
			default 1.0
		}

		parameter float rustBumpNoiseFreq {
			label "Rust Bump Noise Freq"
			default 1.0
		}

		parameter float paintSpec {
			label "Paint Specular Gain"
			default 1.0
		}

		parameter float bumpPaintScale {
			label "Paint Bump Amount"
			default 1.0
		}

		parameter color baseColor {
			detail varying
			label "Base Color"
			default {0 0 0}
		}
	}



	collection void levelAcollection {
		state open
		label "A"
		parameter color layerAColor {
			detail varying
			label "Color A"
			default {0 0 0}
		}
		parameter float noiseScaleA {
			label "Noise Scale A"
			default 1.0
		}
		parameter float noiseFreqA {
			label "Noise Freq A"
			default 1.0
		}

	}
	collection void levelBcollection {
		state open
		label "B"
		parameter color layerBColor {
			detail varying
			label "Color B"
			default {0 0 0}
		}
		parameter float noiseScaleB {
			label "Noise Scale B"
			default 1.0
		}
		parameter float noiseFreqB {
			label "Noise Freq B" 
			default 1.0
		}

	}

	collection void levelCcollection {
		state open
		label "C"
		parameter color layerCColor {
			detail varying
			label "Color C"
			default {0 0 0}
		}
		parameter float noiseScaleC {
			label "Noise Scale C"
			default 1.0
		}
		parameter float noiseFreqC {
			label "Noise Freq C"
			default 1.0
		}
	}

	collection void levelDcollection {
		state open
		label "D"
		parameter color layerDColor {
			detail varying
			label "Color D"
			default {0 0 0}
		}
		parameter float noiseScaleD {
			label "Noise Scale D"
			default 1.0
		}
		parameter float noiseFreqD {
			label "Noise Freq D"
			default 1.0
		}

	}
	collection void levelEcollection {
		state open
		label "E"
		parameter color layerEColor {
			detail varying
			label "Color E"
			default {0 0 0}
		}
		parameter float noiseScaleE {
			label "Noise Scale E"
			default 1.0
		}
		parameter float noiseFreqE {
			label "Noise Freq E" 
			default 1.0
		}

	}

	}	
}
]]></meta>
*/

//TEXTURE ATLAS
void textureatlas(float uOffset; float vOffset){
	//s offset
	float sOffset;
	sOffset = uOffset;

	//extern float s = 1 - s;

	extern float s = s - sOffset;
	//extern float s = sOffset - s;
	//s = s - sOffset;
	//s = 1-s;

	//t offset
	float tOffset;
	tOffset = vOffset;

	//extern float t = 1 - s;\

	//extern float t = tOffset - 1;
	extern float t = t - tOffset;
	//t = t - sOffset;
	t = 1-t;
}

surface rust(
	color	specularColor = 1,
			baseColor = 1.0,
			layerAColor = 1.0,
			layerBColor = 1.0,
			layerCColor = 1.0,
			layerDColor = 1.0,
			layerEColor = 1.0;
	float 	uOffset = 0,
		vOffset = 0,
		mapExport = 1,
		range = .2,
		overallScale = 1,
		rustBumpNoiseDepth = 1,
		rustBumpNoiseFreq  = 1,
		noiseLevel = 0,
		Ka = 	1,
		Kd = 	1,
		rustSpec = 	1,
		paintSpec = 	1,
		noiseScaleA =	1,
		noiseFreqA = 1,
		noiseScaleB =	1,	
		noiseFreqB = 1,
		noiseScaleC =	1,
		noiseFreqC=  1,
		noiseScaleD =	1,
		noiseFreqD=  1,
		noiseScaleE =	1,
		noiseFreqE=  1,
		gammaVal = .4545,
		roughness = 1,
		age =   3,
		bumpPaintScale = 1.2,
		maxLife = 3;
	string	diffuseMapName = "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/stageShotAsset-Version.ext",
		bumpMapName = "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/stageShotAsset-Version.ext", 
		specMapName = "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/stageShotAsset-Version.ext", 
		rusterizerOutputPath = "/DPA/moosefs/show/stage/shot/workflow/asset/version/resolution/type/",
		rusterizerOutputBaseFilename = "stageShotAsset-Version";
	//varying float __faceindex = 1;

	){
	
	//RESET S AND T BASED ON INPUT
	textureatlas(uOffset, vOffset);

	#define gamma(x,value) pow(x,1/value)

	//DEFAULT RUST COLOR
	color rustColor = (.14, .029, .0);

	//SETTING FILENAME BASE TO CELLULAR AUTOMATA SIMULATION OUTPUT
	string	mapbase = format("%s%s",rusterizerOutputPath,rusterizerOutputBaseFilename);

	//NORMALIZING VECTORS
	point Nf = faceforward(normalize(N), I);
	point V = -normalize(I);		

	//FEEDING IN CA OUTPUT
	string mapname = format("%s.%04d.tex",mapbase,clamp(round(age)+1.0, 1, maxLife));

	//USE CA OUTPUT AS ALPHA MASK
	color mapColor = color texture(mapname);
	float alphaValue = float texture(mapname[3]);

	//DIFFUSE MAP
	color diffuseMap = color texture(diffuseMapName);

	//BUMP MAP
	float bumpMap;
	bumpMap = float texture(bumpMapName);

	//SPEC MAP
	float specMap;
	if (specMapName != ""){
	specMap = float texture(specMapName);
	}
	
	//PTEX: USE CA OUTPUT AS ALPHA MASK	
	//color mapColor = color ptexture(mapname, 0, __faceindex);

	//TRANSFORM CURRENT SPACE TO SHADER SPACE
	point PP = transform("shader", P);

	//PRESETS FOR RUST COL0RS

	//initializing colors
	color gammaColorA,gammaColorB,gammaColorC,gammaColorD,gammaColorE,gammaColorF;

	//ADDING NOISE
	
	//1st layer of noise
	float noiseA = float noise(PP * overallScale * noiseScaleA * noiseFreqA)/noiseFreqA;

	//2nd layer of noise
	float noiseB = float noise(PP * overallScale * noiseScaleB * noiseFreqB)/noiseFreqB;

	//3rd layer of noise
	float noiseC = float noise(PP * overallScale * noiseScaleC * noiseFreqC)/noiseFreqC;

	//4th layer of noise
	float noiseD = float noise(PP * overallScale * noiseScaleD * noiseFreqD)/noiseFreqD;

	//5th layer of noise
	float noiseE = float noise(PP * overallScale * noiseScaleE * noiseFreqE)/noiseFreqE;
	
	//SMOOTH TRANSITION BETWEEN RUST NOISE LAYERS
	
	float smoothA = smoothstep(.2,.8,noiseA);
	float smoothB = smoothstep(.2,.8,noiseB);
	float smoothC = smoothstep(.2,.8,noiseC);
	float smoothD = smoothstep(.2,.8,noiseD);
	float smoothE = smoothstep(.2,.8,noiseE);

	//GAMMA CORRECT & COMPOSITE ALL OF THE LAYERS OF RUST

	gammaColorA = color(gamma(baseColor[0],gammaVal),gamma(baseColor[1],gammaVal),gamma(baseColor[2],gammaVal));
	gammaColorB = color(gamma(layerAColor[0],gammaVal),gamma(layerAColor[1],gammaVal),gamma(layerAColor[2],gammaVal));
	gammaColorC = color(gamma(layerBColor[0],gammaVal),gamma(layerBColor[1],gammaVal),gamma(layerBColor[2],gammaVal));
	gammaColorD = color(gamma(layerCColor[0],gammaVal),gamma(layerCColor[1],gammaVal),gamma(layerCColor[2],gammaVal));
	gammaColorE = color(gamma(layerDColor[0],gammaVal),gamma(layerDColor[1],gammaVal),gamma(layerDColor[2],gammaVal));
	gammaColorF = color(gamma(layerEColor[0],gammaVal),gamma(layerEColor[1],gammaVal),gamma(layerEColor[2],gammaVal));


	color rustColorA = mix (gammaColorA, gammaColorB, smoothA);
	color rustColorB = mix (gammaColorC, rustColorA, smoothB); 
	color rustColorC = mix (gammaColorD, rustColorB, smoothC);	
	color rustColorD = mix (gammaColorE, rustColorC, smoothD);
	color rustColorE = mix (gammaColorF, rustColorD, smoothE);

	//SET COLOR TO COMPOSITE OF ALL LAYERS
	
	if (noiseLevel==2){
		rustColor = rustColorA;
	}
	else if (noiseLevel==3){
		rustColor = rustColorB;
	}
	else if (noiseLevel==4){
		rustColor = rustColorC;
	}
	else if (noiseLevel==5){
		rustColor = rustColorD;
	}
	else if (noiseLevel==6){
		rustColor = rustColorE;
	}

	//SET TYPE OF NOISE FOR RUST BUMP
	
	//5th layer of noise
	float rustBumpNoise = float noise(PP *rustBumpNoiseFreq)/rustBumpNoiseFreq;

	//SET OPACITY
	Oi = Os;

	//SET RUST EDGE COLOR
	color rustEdgeColor;
	rustEdgeColor[0] = rustColor[0] + ((1.0-rustColor[0])/6.5);
	rustEdgeColor[1] = rustColor[1] + ((1.0-rustColor[1])/6.8);
	rustEdgeColor[2] = rustColor[2] + ((1.0-rustColor[1])/8.5);

	//SET COLOR OF SURFACE BASED ON RUSTERIZER OUTPUT FRAMES AND BASE TEXTURE MAPS
		//IF MAP EXPORT OFF
		if (mapExport == 1){
			//ASSIGN RUST TEXTURES
			if (mapColor[0] > (range)){
				Nf = normalize(calculatenormal(P + Nf * rustBumpNoise * rustBumpNoiseDepth));
				rustColor = mix(rustEdgeColor, rustColor, alphaValue);
				Ci = Oi * rustColor* (Ka*ambient() + Kd*diffuse(Nf) + rustSpec*specularColor*specular(Nf,V,roughness)); 
			}
			//ASSIGN BASE TEXTURES
			else{	
				Nf = normalize(calculatenormal(P + Nf * bumpMap * bumpPaintScale));
				color gammaDiffuseMap = color(gamma(diffuseMap[0],gammaVal),gamma(diffuseMap[1],gammaVal),gamma(diffuseMap[2],gammaVal));
				Ci = Oi * gammaDiffuseMap* (Ka*ambient() + Kd*diffuse(Nf) + paintSpec*specularColor*specMap*specular(Nf,V,roughness));   
			}
		}
		//IF DIFFUSE MAP EXPORT ON
		else if (mapExport == 2){
			//ASSIGN RUST DIFFUSE TEXTURES
			if (mapColor[0] > (range)){
				rustColor = mix(rustEdgeColor, rustColor, alphaValue);
				Ci = Oi * rustColor; 
			}
			//ASSIGN BASE DIFFUSE TEXTURES
			else{	
				color gammaDiffuseMap = color(gamma(diffuseMap[0],gammaVal),gamma(diffuseMap[1],gammaVal),gamma(diffuseMap[2],gammaVal));
				Ci = Oi * gammaDiffuseMap;   
			}
		}
		//IF SPEC MAP EXPORT ON
		else if (mapExport == 3){
			//ASSIGN RUST TEXTURES
			if (mapColor[0] > (range)){
				Ci = Oi * rustSpec;
			}
			//ASSIGN BASE TEXTURES
			else{	
				Nf = normalize(calculatenormal(P + Nf * bumpMap * bumpPaintScale));
				color gammaDiffuseMap = color(gamma(diffuseMap[0],gammaVal),gamma(diffuseMap[1],gammaVal),gamma(diffuseMap[2],gammaVal));
				Ci = Oi * paintSpec*specMap;   
			}
		}
		//IF BUMP MAP EXPORT ON
		else if (mapExport == 4){
			//ASSIGN RUST TEXTURES
			if (mapColor[0] > (range)){
				Ci = Oi * rustBumpNoise; 
			}
			//ASSIGN BASE TEXTURES
			else{	
				Ci = Oi * bumpMap;   
			}
		}
	} 


