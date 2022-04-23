/// @description

if (keyboard_check_pressed(vk_tab))
	event_perform(ev_mouse,ev_left_press);
	
if (owner!=noone)	{
	if (owner.collapsed)
		iconYScale=1;
	else
		iconYScale=-1;
}