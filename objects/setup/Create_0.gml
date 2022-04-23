/// @description


//System stuff that should be in setup
//Set up display
var windowWidth=480;
var windowHeight=270;

scale=1;
var displayWidth=display_get_width();
var displayHeight=display_get_height();

if (os_browser!=browser_not_a_browser)	{
	var displayWidth=browser_width;
	var displayHeight=browser_height;
}



while (windowWidth*(scale+1)<displayWidth and windowHeight*(scale+1)<displayHeight)
	scale+=1;

window_set_size(windowWidth*scale,windowHeight*scale);
display_set_gui_size(windowWidth,windowHeight);
window_set_caption("A relaxing typing game");

draw_set_font(fnt_consolasSmall);
window_set_cursor(cr_none);

statsInit();

global.caps=false;
global.pause=false;

keyboard_string="";

//Set up data maps
global.unlockables=ds_map_create();
global.completion=ds_map_create();
loadTexts();


global.text=working_directory+"GameBroke.txt";
global.font=fnt_consolas;

alarm[0]=1;

//Set up options and shop grid and everything else lol
optionsInit();
createShop();
achievementsInit();