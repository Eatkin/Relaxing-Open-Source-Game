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
	global.musicVolume=(x-minx)/(maxx-minx);
}

if (x!=xprevious and clicked)
	with (obj_music)
		if (audio_is_playing(musicPlaying))
			audio_sound_gain(musicPlaying,global.musicVolume*global.musicOn*0.5,0);