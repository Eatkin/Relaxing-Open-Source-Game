/// @description

var minWidth=132;
var minHeight=64;

hrepeats=ceil(minWidth/16);
vrepeats=ceil(minHeight/16);

x=(room_width-hrepeats*16)*0.5;
y=(room_height-vrepeats*16)*0.5+room_height;

xstart=x;
ystart=y;

timer=0;				//For easing
easingIn=true;
alpha=0;

//Now create the children which we don't have objects assigned yet
var yy=y+vrepeats*16-35;
child[0]=instance_create_layer(x+16,yy,layer,obj_yesQuitGame);
child[1]=instance_create_layer(x+hrepeats*16-16-sprite_get_width(spr_UIButtonSmall),yy,layer,obj_noQuitGame);

child[0].depth=depth-2;
child[1].depth=depth-2;

depth=depth-1;		//Above all the other HUD stuff