/// @description

//Load file
var fname=global.text;

text=loadTyping(fname);

//Text variables
hBorders=16;
maxWidth=room_width-hBorders*2;

//Add line breaks
//Set the correct font
draw_set_font(global.font);
text=stringAddLineBreaks(text,maxWidth);

textTypedLines=0;
textLines=string_count("\n",text)-1;

//Set up the PROGRESS BAR
instance_create_layer(208,192,"hud",obj_progressBar);
progressBar=true;
chars=0;
totalChars=string_length(text);
progress=0;
obj_progressBar.totalChars=totalChars;

if (global.miscShopBitmasks&ShopMiscBitmasks.ProgressBar!=ShopMiscBitmasks.ProgressBar)	{
	progressBar=false;
	instance_destroy(obj_progressBar);
}

//Set up what we have typed, what we're going to type
textTyped="";
textToBeTyped=string_char_at(text,1);
text=string_delete(text,1,1);

//Save the current line typed and to be typed
currentLineTyped="";
currentLineToBeTyped="";
var i=1;
var _char=string_char_at(text,i);
while (_char!="\n")	{
	i+=1;
	_char=string_char_at(text,i);
	//If a string has zero line breaks, it breaks the loop
	if (_char=="")
		break;
}
currentLineToBeTyped=string_copy(text,1,i);
text=string_delete(text,1,i);

minLineBreakPos=1;		//This is for text draw handling
lineCounter=0;

keyboard_string="";		//Blank the keyboard string

//Stats
points=0;
WPM=0;
accuracy=0;
mistakes=0;
words=0;

//Monitor how long we've been here and whether we've started typing
timer=0;
started=false;
finished=false;
countedStats=false;

//Drawing parameters
vSpacing=64;
textYDraw=vSpacing;			//Where we start drawing
typedHeight=0;

camZoomStrength=1.01;
if (global.miscShopBitmasks&ShopMiscBitmasks.ExtremeScreenShake==ShopMiscBitmasks.ExtremeScreenShake)
	camZoomStrength=2;			//Extreme screen shake

waitingForKeyPress=false;		//pausing thing