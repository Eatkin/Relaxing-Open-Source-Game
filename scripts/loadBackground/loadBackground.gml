function loadBackground(argument0, argument1) {
	var style=argument0;
	var bgref=argument1;

	backgroundStyle=style;
	if (backgroundStyle==BackgroundStyle.BlockColour)
		backgroundColour=bgref;
	else
		global.background=bgref;
	
	//If we stretch the background, calculate scale
	if (backgroundStyle==BackgroundStyle.Stretched)	{
		var bgWidth=sprite_get_width(global.background);
		var bgHeight=sprite_get_height(global.background);
		scale=max(room_width/bgWidth,room_height/bgHeight);
		scale=ceil(scale);			//Integer scale
	}


}
