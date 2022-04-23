/// @description

//If menus are not currently active, don't do anything
if (!clickable)	{
	image_index=0+global.UIOffset*3;
	//Ease in
	var c1 = 1.70158;
	var c2 = c1 * 1.525;

	//Ease in and out
	var factor=(easingTimer<0.5)	?	(power(2*easingTimer,2)*((c2+1)*2*easingTimer-c2))*0.5	:	(power(2*easingTimer-2,2)*((c2+1)*(easingTimer*2-2)+c2)+2)*0.5;
	
	y=ystart-room_height*factor;
	
	if (easingIn)
		easingTimer+=0.02;
	else
		easingTimer-=0.02;
		
	if (easingTimer>=1)
		clickable=true;
	//End easing
	exit;
}

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