/// @description

if (room!=rm_game)	
	exit;

draw_self();
var xx=x+sprite_width*0.5;
var yy=y+sprite_height*0.5;
if ((image_index%3)==2)
	yy+=4;

draw_sprite(mySprite,1-global.pause,xx,yy)