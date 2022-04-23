/// @description black out the screen if we're not at the menu yet

if (room<rm_menu)	{
	draw_set_colour(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
}