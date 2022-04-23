/// @description

drawMenuContainer(hrepeats,vrepeats);

var xx=x+32;
var yy=y+padding;

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_font(fnt_consolasSmall);
var _txt="Controls";
drawTextOutlined(xx-8,yy,_txt,c_white,c_black);
yy+=padding;

//Sorry I can't be bothered to do this properly
draw_set_font(fnt_consolasXSmall);
_txt="Ctrl + P: Pause";
drawTextOutlined(xx,yy,_txt,c_white,c_black);
yy+=padding;
_txt="Ctrl + F: Toggle fullscreen";
drawTextOutlined(xx,yy,_txt,c_white,c_black);
yy+=padding;
_txt="Ctrl + S: Skip song";
drawTextOutlined(xx,yy,_txt,c_white,c_black);
yy+=padding;
_txt="Tab: toggle stats bar";
drawTextOutlined(xx,yy,_txt,c_white,c_black);
yy+=padding;
draw_set_font(fnt_consolasSmall);
_txt="Licences";
drawTextOutlined(xx-8,yy,_txt,c_white,c_black);