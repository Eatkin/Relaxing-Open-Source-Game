/// @description

draw_self();
var xx=x+sprite_width*0.5;
var yy=y+sprite_height*0.5;
if ((image_index%3)==2)
	yy+=3;
	
draw_sprite(mySprite,0,xx,yy);