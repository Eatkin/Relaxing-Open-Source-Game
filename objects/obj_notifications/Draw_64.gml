/// @description

draw_set_alpha(0.8);

var top=global.UIOffset*32;

draw_sprite_part(spr_3slice,0,0,top,16,32,textX,textY);
for (var i=0; i<hrepeats;i+=1)
	draw_sprite_part(spr_3slice,0,16,top,16,32,textX+16*(i+1),textY);
	
draw_sprite_part(spr_3slice,0,32,top,16,32,textX+16*(i+1),textY);
draw_set_font(fnt_consolasXSmall);

var padding=11;
draw_set_valign(fa_middle);
//Draw the icon
var spr=spr_musicIcon;
if (type=Type.Achievement)
	spr=spr_achievementIconSmall;

var xx=textX+padding+8;		//Drawn at middle centre
var yy=textY+16;

draw_sprite(spr,0,xx,yy);

drawTextOutlined(textX+padding*2+16,textY+16,text,c_white,c_black);
draw_set_valign(fa_top);

draw_set_alpha(1);