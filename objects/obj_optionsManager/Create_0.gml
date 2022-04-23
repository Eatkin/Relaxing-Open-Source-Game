/// @description

targetPage=1;
page=1;
scrolling=false;
scrollTimer=0;

child=0;

x=room_width;

var padding=8+sprite_get_width(spr_UIButton);
var downB=instance_create_layer(x+room_width-padding,room_height-padding,layer,obj_downButton);
downB.owner=id;
child[0]=downB

//create up button
var upB=instance_create_layer(x+room_width-padding,room_height+padding-sprite_get_width(spr_UIButton),layer,obj_upButton);
upB.owner=id;
child[1]=upB;