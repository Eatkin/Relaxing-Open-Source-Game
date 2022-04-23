/// @description

if (keyboard_check_pressed(20))
	global.caps=!global.caps;
	
if (os_browser!=browser_not_a_browser)	{
	
	//Set up display
	var windowWidth=480;
	var windowHeight=270;

	scale=1;
	var displayWidth=display_get_width();
	var displayHeight=display_get_height();

	while (windowWidth*(scale+1)<=displayWidth and windowHeight*(scale+1)<=displayHeight)
		scale+=1;

	window_set_size(windowWidth*scale,windowHeight*scale);
	}