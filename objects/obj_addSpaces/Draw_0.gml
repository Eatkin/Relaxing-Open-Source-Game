/// @description

// Inherit the parent event
event_inherited();

var xx=x+buttonWidth-sprite_get_width(spr_tickIcon)*0.5-16;
var yy=y+sprite_height*0.5;
if ((image_index%3)==2)
	yy+=4;
draw_sprite(myIcon,0,xx,yy);