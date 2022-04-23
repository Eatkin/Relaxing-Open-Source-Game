/// @description

drawMenuContainer(hrepeats,vrepeats);

draw_set_font(fnt_consolasSmall);

var padding=8;
var x1=x+padding;
var y1=y+padding;
var x2=x+hrepeats*16-padding;
var y2=y+vrepeats*16-padding;
//Let's draw stats at the side
drawTextOutlined(x1,y1,"Characters: "+string(points),c_white,c_black);
draw_set_halign(fa_right);
drawTextOutlined(x2,y1,"Mistakes: "+string(mistakes),c_white,c_black);
draw_set_valign(fa_bottom);
drawTextOutlined(x2,y2,"Accuracy: "+string(accuracy*100)+"%",c_white,c_black);
draw_set_halign(fa_left);
drawTextOutlined(x1,y2,"WPM: "+string(round(WPM)),c_white,c_black);

draw_set_valign(fa_top);