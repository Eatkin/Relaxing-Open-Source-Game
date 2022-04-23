/// @description

var width=sprite_width+32;
var height=sprite_width;

hrepeats=width/16;
vrepeats=height/16;

menusActive=false;

x=(room_width-hrepeats*16)*0.5;
y=(room_height-vrepeats*16)*0.5;

instance_create_layer(0,0,layer,obj_fadeOutOfBlack);

//Move all the buttons about
padding=20;
sprHeight=sprite_get_height(spr_UIButton);
obj_cc3.y=y+padding*6.7;
obj_cc3.x=x+32;
obj_cc4.y=y+padding*7.2+sprHeight;
obj_cc4.x=x+32;