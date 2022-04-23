/// @description

//Draw me!
//LHS
draw_sprite_part(sprite_index,image_index,0,0,16,49,x,y);
//repeats
var repeats=ceil(buttonWidth/16);
for (var i=0; i<repeats-1; i+=1)
	draw_sprite_part(sprite_index,image_index,16,0,16,49,x+(i+1)*16,y);
	
//RHS
draw_sprite_part(sprite_index,image_index,33,0,16,49,x+(i+1)*16,y);

draw_set_font(fnt_consolasXSmall);
draw_set_valign(fa_middle);
var padding=16;
var xx=x+padding;
var yy=y+sprite_height*0.5;
if ((image_index%3)==2)
	yy+=4;

//Leave room for the sprite
drawTextOutlinedExt(xx,yy,textName,buttonWidth-padding*2-48,c_white,c_black);
draw_set_valign(fa_top);

var spr=-1;
if (locked)
	spr=spr_padlockIcon;
else if (completed)
	spr=spr_tickIcon;
	

if (spr!=-1)
	draw_sprite(spr,0,xx+buttonWidth-padding-16,yy);