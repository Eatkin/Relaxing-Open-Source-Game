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

drawTextOutlinedExt(xx,yy,name,x+buttonWidth-padding*2-32,c_white,c_black);		//-32 to allow room for a padlock

if (active)	{
	var xx=x+buttonWidth-padding;
	draw_sprite(spr_tickIcon,0,xx,yy);
}

if (!unlocked)	{
	var xx=x+buttonWidth-padding;
	draw_sprite(spr_padlockIcon,0,xx,yy);
	yy+=4;
	var str="x"+string(cost);
	var xoffset=0.5*(20+string_width(str));
	draw_sprite(spr_coin,0,xx-xoffset,yy);
	draw_set_font(fnt_consolasXSmall);
	drawTextOutlined(xx-xoffset+20,yy,str,c_white,c_black);
}

draw_set_valign(fa_top);