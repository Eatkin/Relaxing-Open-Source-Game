/// @description

switch (backgroundStyle)	{
	case BackgroundStyle.Stretched:
		draw_sprite_ext(global.background,0,0,0,scale,scale,0,c_white,1);
		break;
	case BackgroundStyle.Tiled:
		draw_sprite_tiled(global.background,0,0,0);
		break;
	case BackgroundStyle.BlockColour:
		draw_set_colour(backgroundColour);
		draw_rectangle(0,0,room_width,room_height,false);
		break;
}