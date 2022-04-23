/// @description

var x1=0;
var y1=0;
var x2=room_width;
var y2=room_height;

draw_set_alpha(alpha);
draw_set_colour(c_black);
draw_rectangle(x1,y1,x2,y2,false);
draw_set_alpha(alpha*2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.font);
drawTextOutlinedTransformed(room_width*0.5,room_height*0.5,"PAUSED",2,2,0,c_white,c_black,2);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);