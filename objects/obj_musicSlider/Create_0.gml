/// @description

slider=instance_create_layer(x,y+5,"hud",obj_sliderArrowMusic);
//Now adjust position based on sound volume
var pos=global.musicVolume*sprite_width;
slider.minx=x;
slider.maxx=x+sprite_width;
slider.x+=pos;

image_index=global.UIOffset;
image_speed=0;