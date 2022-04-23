/// @description

image_alpha=lerp(image_alpha,global.caps,0.5);

//If it's turned off never show it
if (!global.showCapsIndicator)
	image_alpha=0;