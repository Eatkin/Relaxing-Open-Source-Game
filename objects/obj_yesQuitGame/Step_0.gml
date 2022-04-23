/// @description

if (obj_quitGameContainer.timer<1)
	exit;

if (mouse_x==clamp(mouse_x,bbox_left,bbox_right) and mouse_y==clamp(mouse_y,bbox_top,bbox_bottom))	{
	if (mouse_check_button(mb_left) and image_index%3!=2)	{
		image_index=2+global.UIOffset*3;
		playSound(snd_switch2);
	}
	else if ((image_index%3)==0)	{
		image_index=1+global.UIOffset*3;
		playSound(snd_rollover1);
	}
	if (mouse_check_button_released(mb_left))	{
		playSound(snd_click1);
		event_user(0);
	}
}
else
	image_index=0+global.UIOffset*3;