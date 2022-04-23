/// @description draw tooltip


if ((image_index%3)>0)	{
	draw_set_font(fnt_consolasXSmall);
	var mx=min(mouse_x+12,room_width-string_width(tooltip));
	var my=mouse_y+12;
	draw_set_colour(c_white);
	drawTextOutlined(mx,my,tooltip,c_white,c_black);
}