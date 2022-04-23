/// @description

//If we're transitioning into the level, just blank the keyboard string and exit the function
if ((instance_exists(obj_fadeOutOfBlack) and obj_fadeOutOfBlack.timer>0.5) or global.pause)	{
	keyboard_string="";
	exit;
}

if (keyboard_check(vk_control) and !keyboard_check(vk_alt))
	keyboard_string="";

if (instance_exists(obj_pauseOverlay))
	waitingForKeyPress=true;
	
if (waitingForKeyPress and keyboard_string!="")
	waitingForKeyPress=false;

if (waitingForKeyPress)
	exit;

if (!started and keyboard_string!="")
	started=true;
	
if (started and !finished)
	timer+=1;
	


var charToType=textToBeTyped;
var charTyped=string_char_at(keyboard_string,1);

if (global.ignoreCase)	{
	charToType=string_lower(charToType);
	charTyped=string_lower(charTyped);
}

//Failsafe (but check its not the line break character)
if (ord(charToType)!=clamp(ord(charToType),32,136) and charToType!=chr(182))
	charTyped=charToType;

//Cheating for me 
if (keyboard_check(vk_control) and keyboard_check(ord("E")))
	charTyped=charToType;
	
//This character ONLY shows if you have manual line breaks added in
if (charToType==chr(182))	{
	if (keyboard_check_pressed(vk_enter))	{
		keyboard_string=string_delete(keyboard_string,1,1);
		charTyped=chr(182);
	}
}

//If there is a match
if (charToType==charTyped and !finished)	{
	//Reshape the strings
	//textTyped+=textToBeTyped;
	playSound(snd_tick);
	
	currentLineTyped+=textToBeTyped;
	textToBeTyped=string_copy(currentLineToBeTyped,1,1);
	currentLineToBeTyped=string_delete(currentLineToBeTyped,1,1);
	
	//Increment score
	points+=1;
	if (textToBeTyped==" ")
		words+=1;
	
	//Now problem is, the next char may be a line break, if it is we update a bunch of shit
	var extraChars=0;
	while (textToBeTyped=="\n")	{
		//Add our current line to what we've typed
		textTyped+=currentLineTyped;
		//Add a line break
		textTyped+=textToBeTyped;
		//Copy the next thing to type
		textToBeTyped=string_copy(text,1,1);
		//Delete it
		text=string_delete(text,1,1);
		//Blank what we've typed on the current line
		currentLineTyped="";
		
		//Update line counts
		textTypedLines+=1;
		textLines-=1;
		
		//IMPORTANT - repeat the loop if there's multiple line breaks
		if (textToBeTyped=="\n")
			continue;
		//Update current line to be typed
		var i=1;
		while (string_char_at(text,i)!="\n")	{
			i+=1;
			//If we're outside of the bounds of the text, then we break the loop
			if (string_char_at(text,i)=="")
				break;
		}
		currentLineToBeTyped=string_copy(text,1,i);
		text=string_delete(text,1,i);
		extraChars+=1;
	}
	//Update typed height
	//A bit stupid but to measure the height correctly have to set the font again
	draw_set_font(global.font);
	typedHeight=string_height(textTyped);
	
	//If the final string is an empty string, text has finished
	if (textToBeTyped=="")	{
		words+=1;
		finished=true;
		
		//Now update completion status of the text
		ds_map_set(global.completion,global.text,true);
	}
	
	//PROGRESS BAR
	if (progressBar)
		with (obj_progressBar)	{
			chars+=1+extraChars;
			event_user(0);
		}
		
	chars+=1+extraChars;
	progress=floor((chars/totalChars)*100);
	
	//This removes the first character of keyboard_string so people can type multiple keys per frame, which is highly unlikely but posisble
	if (string_length(keyboard_string)>1)
		keyboard_string=string_delete(keyboard_string,1,1);
	else
		keyboard_string="";
}
else if (keyboard_string!="" and !finished)	{
	mistakes+=1;
	if (global.screenShake)	{
		obj_cam.zoom=camZoomStrength;
		var snd=snd_fuck;
		if (global.miscShopBitmasks&ShopMiscBitmasks.DisOmikron==ShopMiscBitmasks.DisOmikron)
			snd=snd_disOmikronScreaming;

		playSound(snd);
	}
	keyboard_string="";			//Blank keyboard_string again
}



//Calculate WPM, accuracy etc
var secs=timer/60;
var mins=secs/60;
if (timer!=0)	{
	WPM=words/mins;
	accuracy=points/(points+mistakes);
}

//Pass these to stats Container
obj_statsContainer.WPM=WPM;
obj_statsContainer.accuracy=accuracy;
obj_statsContainer.mistakes=mistakes;
obj_statsContainer.points=points;

//Now update the drawing position
textYDraw=lerp(textYDraw,vSpacing-typedHeight,0.1);

if (finished and !countedStats)	{
	//Mistakes is built into accuracy otherwise you might get a negative score
	var totalScore=points*accuracy*WPM*0.01;
	statsUpdate(WPM,accuracy,words,points,mistakes,totalScore);
	saveGame();
	countedStats=true;
	progress=100;
}