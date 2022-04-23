/// @description

var width=288;
x=(room_width-width)*0.5;
x+=room_width;
xstart=x;

var height=176;
height=ceil(height/16)*16;
y=(room_height-height)*0.5;
ystart=y;

//Now stuff for buttons
hrepeats=width/16;
vrepeats=height/16;

active=false;
time=0;

//Back button
child[0]=instance_create_layer(room_width+8,room_height-8-sprite_get_height(spr_UIButton),layer,obj_backButton);
child[0].owner=object_index;