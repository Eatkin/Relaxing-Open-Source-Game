/// @description

if (!clicked and mouse_check_button(mb_left) and mouse_x==clamp(mouse_x,bbox_left,bbox_right) and mouse_y==clamp(mouse_y,bbox_top,bbox_bottom))	{
	var otherClicked=false;
	with (par_sliderArrow)
		if (clicked)
			otherClicked=true;
		
	if (!otherClicked)
		clicked=true;
}
	
if (mouse_check_button_released(mb_left))
	clicked=false;
	
	
//Move slider and clamp
if (clicked)	{
	x=mouse_x;
	x=clamp(x,minx,maxx);
	global.soundVolume=(x-minx)/(maxx-minx);
}

if (x!=xprevious and clicked and (snd==noone or !audio_is_playing(snd)))
	playSound(snd_click1);