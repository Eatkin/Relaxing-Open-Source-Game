/// @description

WPM=0;
WPMCounter=0;
accuracy=0;
accuracyCounter=0;
mistakes=0;
mistakesCounter=0;
coinsEarned=0;
newWPMRecord=false;

stuffCounted=false;

coinCounter=0;
coinsCounted=false;

alpha=0;									//For drawing the background black rectangle
maxAlpha=0.8;

WPMRecordScale=6;
WPMRecordAngle=45;
WPMZoomed=false;

//For drawing the menu box
hrepeats=192/16;
vrepeats=144/16;

//Coords
x=(room_width-hrepeats*16)*0.5;
y=room_height*1.2;						//Start below the screen
hitYTarget=false;

countingSoundTimerMax=1;
countingSoundTimer=0;