/// @description

// Inherit the parent event
event_inherited();

draw_set_font(fnt_consolasXSmall);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var txt=(global.customTextName=="")	?	"No file selected"	:	global.customTextName;

drawTextOutlined(x+55,y+25,txt,c_white,c_black);