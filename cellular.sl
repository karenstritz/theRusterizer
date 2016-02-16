surface
cellular(float init = 1,     /* [0 or 1] Set to 1 for the first frame */
               ageIncrement = 0,
               count = 1024;   /* Number of cells                       */
        string oldcell = "", /* Cell values from previous frame       */
               newcell = "",  /* Cell values for the current frame     */
	           mapname = "",
               probMapName = "";
              )
{
float    stepSize = 1.0/count;
float    halfStep = stepSize/2;
float    ss = s + halfStep;
float    tt = t + halfStep;

//LIFE STATE
float    thisCurrLife;
float    thisPrevLife;

//AGE STATE
float    thisCurrAge;
float    thisPrevAge;

point    thisCellPos = point "world" (ss, 0, tt);
float    cellLife[8] = {0,0,0,0,0,0,0,0};
point    cellPos[8];    // neighborhood cell positions
normal   n = 0;        // no useful data for the normal
float    numLive = 0;
//string	mapname = "/DPA/moosefs/2013KarenThesis/lookdev/share/assets/sphereInputMapStart/0001/med/png/sphereInputMapStart-0001.tex";
color 	mapColor = color texture(mapname);

float   probabilityA;
float   probabilityB;

if (probMapName != ""){  
    color   probMapColor = color texture(probMapName);
    probabilityA = probMapColor[0];
    probabilityB = (probabilityA - ((1.0-probabilityA)/2.0));
}

else {
    //print "No Probability Map Set, Using Default Values Instead";
    probabilityA = .3;
    probabilityB = .7;
}

//MAKE SURE PROBABILITY B DOESNT GO OUTSIDE 0-1 RANGE

if (probabilityB < 0.0){
    probabilityB = 0.0;    
}
if (probabilityB > 1.0){
    probabilityB = 1.0;    
}
  
if(init){
    if (mapColor[0] > 0){
	mapColor[0] = 1.0;
    }
    else {
	mapColor[0] = 0.0;	
    }
    thisCurrLife = mapColor[0];//(random() > 0.61) ? 1 : 0;
    thisCurrAge = 0;
}
if(init != 1 && oldcell != "") {
    // Determine the coordinates the cells in the immediate 
    // neighborhood of the current micropolygon. Note we wrap
    // to avoid attempting to access non existent cells.
    float sb = ss - stepSize;    // s back
    if(sb < 0) 
        sb = 1 - halfStep;
    
    float sf = ss + stepSize;     // s forward
    if(sf > 1)
        sf = halfStep;
        
    float tb = tt - stepSize;     // t back
    if(tb < 0)
        tb = 1 - halfStep;
        
    float tf = tt + stepSize;     // t forward
    if(tf > 1)
        tf = halfStep;
    
    cellPos[0] = point "world" (sb, 0, tb);
    cellPos[1] = point "world" (ss, 0, tb);
    cellPos[2] = point "world" (sf, 0, tb);
        
    cellPos[3] = point "world" (sb, 0, tt);
    cellPos[4] = point "world" (sf, 0, tt);
  
    cellPos[5] = point "world" (sb, 0, tf);
    cellPos[6] = point "world" (ss, 0, tf);
    cellPos[7] = point "world" (sf, 0, tf);
    
    // Query the value the current cell had in the previous frame
    // of animation.
    texture3d(oldcell, thisCellPos, n, "_cellLife", thisPrevLife, "_cellAge", thisPrevAge);
  
    float j;

    // Query the value of neighbors and assign their values
    // to the cellLife array.
    for(j = 0; j < 8; j = j + 1) {
        texture3d(oldcell, cellPos[j], n, "_cellLife", cellLife[j]);
        }

    // Count the live cells.
    for(j = 0; j < 8; j = j + 1) {
        cellLife[j] = (cellLife[j] > 1.0) ? 1 : 0;
        if(round(cellLife[j]) == 1) {
            numLive = numLive + 1;
            }
        }

    // Apply the rules of life
    if(thisPrevLife >= 1){
        thisPrevLife = 1;
    }
    else{
        thisPrevLife = 0;
    }
    if(thisPrevLife == 1) {
        thisCurrLife = thisPrevLife;    // continue living
        thisCurrAge = thisPrevAge + ageIncrement;
    }
    else if(thisPrevLife == 0 && numLive == 3 && float random() <= probabilityA) {
        thisCurrLife = 1;    // birth
    }
	else if(thisPrevLife == 0 && numLive == 4 && float random() <= probabilityB){
        thisCurrLife = 1;    // birth
    }
}

//RESTRICT MAX AGE TO 1
if (thisCurrAge > 1){
    thisCurrAge = 1;
}

if(newcell != "") {
    // Bake the value of the cell (micropolygon). Its bumped up
    // to ensure that any slight numeric inaccuracies ie. 0.99999
    // go way over 1.0000. This was an issue during the development
    // of the shader and its done here as a precaution!
    bake3d(newcell, "_cellLife,_cellAge", thisCellPos, n, "interpolate", 1,
                    "_cellLife", thisCurrLife * 2, "_cellAge", thisCurrAge);
}
Oi = thisCurrAge;
Ci = thisCurrLife;
}

