/// @description

var typedColour=c_green;
var toBeTypedColour=c_yellow;
var textColour=c_white;

//Set up a load of sub strings to draw
//First we draw the text we've typed
draw_set_font(global.font);
var textx=hBorders;

var outlineSize=2;

/*
textYDraw
line
line
line
roomBoundary
line

So basically we want to remove lines prior to the room boundary
*/

var typed=textTyped;

//Get the height of textTyped
var typedHeight=string_height(textTyped);
var lines=textTypedLines;
var heightPerLine=typedHeight/lines;
var lineStart=0;
//THIS IS CAUSING LAG - THE WHILE LOOP IS ESSENTIALLY UNCAPPED SO LONGER PASSAGES INCREASE FOREVER
//Okay fixed it now
if (textYDraw<heightPerLine)	{
	lineStart=floor(abs(textYDraw)/heightPerLine);
	var i=minLineBreakPos;
	var lineCount=lineCounter;
	while (true)	{
		if (lineCount==lineStart)	{
			minLineBreakPos=i;
			lineCounter=lineCount;
			break;
		}
		
		var char=string_char_at(textTyped,i);
		if (char=="\n")
			lineCount+=1;
		
		if (char=="")	{
			i=1;
			break;
		}
		i+=1;
	}
	
	//Now we copy from here to string end
	typed=string_copy(textTyped,i,string_length(textTyped)-i);
}


drawTextOutlined(textx,textYDraw+lineStart*heightPerLine,typed,typedColour,c_black,outlineSize);

//Now draw what we've typed on the current line
var xOffset=0
var width=string_width(currentLineTyped);
var totalWidth=width+string_width(textToBeTyped)+string_width(currentLineToBeTyped);

var allowedWidth=room_width;
if (totalWidth>allowedWidth)
	if (width>room_width*0.5)
		xOffset=-min(abs(room_width*0.5-width), abs(allowedWidth-totalWidth)+16);
		
var height=string_height(textTyped);
drawTextOutlined(textx+xOffset,textYDraw+height,currentLineTyped,typedColour,c_black,outlineSize);

//Draw remainder of this line
var width=string_width(currentLineTyped);
//Swap spaces with underscores
var toBeTyped=textToBeTyped;
var toBeTypedWidth=string_width(toBeTyped);
if (toBeTyped==" ")
	toBeTyped="_";
	
drawTextOutlined(textx+width,textYDraw+height-2,toBeTyped,toBeTypedColour,c_black,outlineSize);
width+=toBeTypedWidth;																									//Sometimes the underscore is wider than a space character
																														//Because some heathens use non-monospaced fonts
																														//So toBeTypedWidth = width of a space char hwen it's actually an underscore
drawTextOutlined(textx+width,textYDraw+height,currentLineToBeTyped,textColour,c_black,outlineSize);

height+=max(string_height(currentLineTyped),string_height(textToBeTyped),string_height(currentLineToBeTyped));

//Draw everything else
//We need to measure how many lines to print
//Our remaining space on the screen is room_height-(textYDraw+height)
var remainingHeight=room_height-textYDraw-height;
var remainingTextHeight=string_height(text);
var lines=textLines;
var heightPerLine=remainingTextHeight/lines;
var linesToDraw=ceil(remainingHeight/heightPerLine);
var textToDraw=text;
if (remainingTextHeight>remainingHeight)	{
	var i=1;
	var lineCount=0;
	while (true)	{
		if (lineCount==linesToDraw)
			break;
		
		var char=string_char_at(text,i);
		if (char=="\n")
			lineCount+=1;
		
		if (char=="")
			break;		//Break means textToDraw=text
		i+=1;
	}
	
	textToDraw=string_copy(text,1,i);
}
drawTextOutlined(textx,textYDraw+height,textToDraw,textColour,c_black,outlineSize);

//Progress text
var xdraw=obj_statsContainer.x;
var ydraw=obj_statsContainer.y-20;

//Draw 3 slice and percentage completed
var top=global.UIOffset*32;

//This is a half-width 3-slice so draw top half then bottom half
repeat(2)	{
	draw_sprite_part(spr_3slice,0,0,top,16,8,xdraw,ydraw);
	draw_sprite_part(spr_3slice,0,32,top,16,8,xdraw+16,ydraw);
	top+=24;
	ydraw+=8;
}
	
draw_set_font(fnt_consolasXSmall);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);
draw_text(xdraw+16,ydraw-8,string(progress)+"%");

draw_set_halign(fa_left);
draw_set_valign(fa_top);