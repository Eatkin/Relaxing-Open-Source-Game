/// @description

var width=288;
x=(room_width-width)*0.5;
x+=room_width;
xstart=x;

var padding=8;
var height=236;
height=ceil(height/16)*16;
y=(room_height-height)*0.5;
ystart=y;

//Now stuff for buttons
hrepeats=width/16;
vrepeats=height/16;

active=false;
time=0;

//Create the children
var sprHeight=sprite_get_height(spr_UIButton);
var hpadding=(width-224)*0.5;
child[0]=instance_create_layer(x+hpadding,y+padding,layer,obj_capsIndicatorButton);
child[1]=instance_create_layer(x+hpadding,y+padding*2+sprHeight,layer,obj_resetCapsStatus);
/*Sliders
288, each slider is 64+24 for icon (88)
|--|_____|--|_____|--|
112 left, 3 spaces at about 37, 37, 38
45 at the edge though, because icons are drawn to the side independant of object
Second is at 45+128+38, or 128+83=228-17=211
*/

child[2]=instance_create_layer(x+hpadding,y+padding*3+sprHeight*2,layer,obj_ignoreCase);
child[3]=instance_create_layer(x+45,y+padding*4+sprHeight*3,layer,obj_volumeSlider);
child[4]=instance_create_layer(x+200,y+padding*4+sprHeight*3,layer,obj_musicSlider);		//I actually manually adjusted the position because it looks better

//This commented out code creates a back button to the right of the menu, but I kept accidentally clicking it
//child[4]=instance_create_layer(x+width+padding,y+height-sprite_get_height(spr_UIButton),layer,obj_backButton);

//This creates it in the bottom left
child[5]=instance_create_layer(room_width+8,room_height-8-sprite_get_height(spr_UIButton),layer,obj_backButton);
child[5].owner=object_index;

//Layering problems with the Windows build, even though I don't like doing this
for (var i=0; i<array_length_1d(child); i+=1)
	child[i].depth-=1;