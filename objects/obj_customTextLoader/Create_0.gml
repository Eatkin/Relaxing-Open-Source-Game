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
padding=8;
sprHeight=sprite_get_height(spr_UIButton);
obj_loadTextButton.y=y+padding;
obj_isPoem.y=y+padding*2+sprHeight;
//Gap for "need some inspiration"?
obj_gutenberg.y=y+padding*5+sprHeight*2;
obj_PDP.y=y+padding*6+sprHeight*3;