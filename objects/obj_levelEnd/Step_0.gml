/// @description

//Do some lerrrrrrrrrrrrrps
var ytarget=room_height*0.1;
y=lerp(y,ytarget,0.1);

if (abs(y-ytarget)<1)	{
	y=ytarget;
	hitYTarget=true;
}

alpha=lerp(alpha,maxAlpha,0.1);

if (hitYTarget)	{
	var pass;
	pass[0]=false;
	pass[1]=false;
	WPMCounter=min(WPMCounter+WPM*0.01,WPM);
		
	if (WPMCounter==WPM)	{
		pass[0]=true;
		accuracyCounter=min(accuracyCounter+accuracy*0.01,accuracy);
	}
	
	if (accuracyCounter==accuracy)	{
		pass[1]=true;
		mistakesCounter=min(mistakesCounter+mistakes*0.01,mistakes);
	}
	
	if (mistakesCounter==mistakes and pass[0] and pass[1])
		stuffCounted=true;
	
	if (stuffCounted and !coinsCounted)	{
		var tempCoins=floor(coinCounter);
		coinCounter=min(coinCounter+coinsEarned*0.01,coinsEarned);
		//Play a sound every time a coin is added because this can potentially count much slower than the other things
		if (floor(coinCounter)>tempCoins and !audio_is_playing(counting))
			playSound(counting);
			
		//Very important to have !coinsCounted otherwise it infinitely adds coins to global.coins
		if (coinCounter==coinsEarned and !coinsCounted)	{
			coinCounter=coinsEarned;
			coinsCounted=true;
			global.coins+=coinsEarned;
		}
	}
	
	//Play counting sounds - this looks stupid complicated but it just plays a sound every 30 frames
	if (!stuffCounted)	{
		if (!audio_is_playing(counting))	{
			if (countingSoundTimer==0)	{
				playSound(counting);
				countingSoundTimer=countingSoundTimerMax;
			}
			else
				countingSoundTimer=max(0,countingSoundTimer-1);
		}
	}
}

if (coinsCounted and !WPMZoomed and newWPMRecord)	{
	WPMRecordScale=lerp(WPMRecordScale,1.2,0.2);
	WPMRecordAngle=lerp(WPMRecordAngle,20,0.2);
	if (WPMRecordScale<1.3)	{
		WPMZoomed=true;
		obj_cam.zoom=1.05;
		if (global.miscShopBitmasks&ShopMiscBitmasks.ExtremeScreenShake==ShopMiscBitmasks.ExtremeScreenShake)
			obj_cam.zoom=2;
		WPMRecordScale=1.2;
		WPMRecordAngle=20;
		playSound(smack);
	}
}

if (keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left) and !coinsCounted)	{
	y=ytarget;
	accuracyCounter=accuracy;
	WPMCounter=WPM;
	mistakesCounter=mistakes;
	coinCounter=coinsEarned;
	stuffCounted=true;
	coinsCounted=true;
	global.coins+=coinsEarned;
}

if (coinsCounted and !instance_exists(obj_continueButton))	{
	var padding=16;
	instance_create_layer(x+hrepeats*16+padding,y+vrepeats*16-sprite_get_height(spr_UIButton),layer,obj_continueButton);
}