/// @description

global.background=spr_forestBackground;

var bgWidth=sprite_get_width(global.background);
var bgHeight=sprite_get_height(global.background);

backgroundColour=c_aqua;

backgroundStyle=BackgroundStyle.Stretched;
scale=max(room_width/bgWidth,room_height/bgHeight);
scale=ceil(scale);			//Integer scale