/// @description

drawMenuContainer(hrepeats,vrepeats);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_consolasXSmall);

var padding=8;

var spr=spr_tickIconSmall;
if (achieved==false)
	spr=spr_crossIconSmall

draw_sprite(spr,0,x+padding+8,y+padding+8);		//Account for sprite centres

drawTextOutlined(x+padding*2+32,y+padding,achName,c_white,c_black);

var w=hrepeats*16-padding*2;
drawTextOutlinedExt(x+padding,y+padding*3,achDescription,w,c_white,c_black);