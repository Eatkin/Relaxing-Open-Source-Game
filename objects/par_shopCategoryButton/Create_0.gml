/// @description

image_speed=0;
name="Something went wrong";

//This scales up the collision box
buttonWidth=320;
var sprw=ceil(buttonWidth/16)*16;
image_xscale=sprw/sprite_width;

//Here's a bunch of variable defaults
cost=0;
unlocked=true;
active=false;
ref=0;
type=ShopCategory.UI;

//Background stuff
BGType=BackgroundStyle.BlockColour;
BGRef=c_aqua;

//Fonts
fontRef=fnt_consolas;