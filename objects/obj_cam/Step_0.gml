/// @description

if (zoom==1)	{
	camera_set_view_size(cam,room_width,room_height);
	camera_set_view_pos(cam,0,0);
	camera_set_view_angle(cam,0);
}
	
var camw=(room_width/zoom);
var camh=(room_height/zoom);

camera_set_view_size(cam,camw,camh);

var camx=(room_width-camw)*0.5;
var camy=(room_height-camh)*0.5;
camera_set_view_pos(cam,camx,camy);

var maxangle=45;
if (zoomDecayRate<0.1)
	maxangle=90;
	
var angle=choose(1,-1)*(zoom-1)*irandom(maxangle);
camera_set_view_angle(cam,angle);
	
zoom=lerp(zoom,1,zoomDecayRate);