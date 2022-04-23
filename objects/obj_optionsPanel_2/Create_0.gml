/// @description

var width=288;
x=(room_width-width)*0.5;
x+=room_width;
xstart=x;

var padding=8;
var height=236;				//57px per button + extra 8 for initial padding
height=ceil(height/16)*16;
y=(room_height-height)*0.5;
y+=room_height;
ystart=y;

//Now stuff for buttons
hrepeats=width/16;
vrepeats=height/16;

active=false;
time=0;

//Create the children
var sprHeight=sprite_get_height(spr_UIButton);
var hpadding=(width-224)*0.5;
child[0]=instance_create_layer(x+hpadding,y+padding,layer,obj_manualLineBreak);
//child[1]=instance_create_layer(x+hpadding,y+padding*2+sprHeight,layer,obj_addSpaces);
child[1]=instance_create_layer(x+hpadding,y+padding*2+sprHeight,layer,obj_showNotifications);
child[2]=instance_create_layer(x+hpadding,y+padding*3+sprHeight*2,layer,obj_screenShake);
child[3]=instance_create_layer(x+hpadding,y+padding*4+sprHeight*3,layer,obj_addSpaces);

//Layering problems with the Windows build, even though I don't like doing this
for (var i=0; i<array_length_1d(child); i+=1)
	child[i].depth-=1;