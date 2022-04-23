/// @description

draw_set_alpha(alpha);
draw_set_colour(c_black);
var x2=room_width;
var y2=room_height;
draw_rectangle(0,0,x2,y2,false);
draw_set_alpha(1);

//Draw the 9-slice
drawMenuContainer(hrepeats,vrepeats);

var padding=8;
draw_set_font(fnt_consolasXSmall);
drawTextOutlined(x+padding,y+padding,"Exit to menu?",c_white,c_black);