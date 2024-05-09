run("Options...", "iterations=1 count=1 black do=Nothing");
run("Colors...", "foreground=white background=black selection=yellow");


run("Z Project...", "projection=[Max Intensity]");
setOption("ScaleConversions", true);
run("8-bit");

rename("raw");
run("Subtract Background...", "rolling=20");
run("Duplicate...", "title=copy");
selectWindow("copy");
run("Despeckle");
run("Median...", "radius=2");
run("Smooth");
run("Fire");

setAutoThreshold("Default dark");
run("Threshold...");
setThreshold(27, 255);
setOption("BlackBackground", true);
run("Convert to Mask");
run("Watershed");
run("Set Measurements...", "area area_fraction redirect=None decimal=3");
run("Analyze Particles...", "size=0-Infinity clear add");
roiManager("Show All without labels");
selectWindow("raw");
roiManager("Show None");
roiManager("Show All");
roiManager("Measure");


//
