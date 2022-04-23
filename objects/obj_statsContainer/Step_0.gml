/// @description

var targetY=ystart;

if (collapsed)
	targetY=room_height;
	
y=lerp(y,targetY,0.25);

collapser.y=y;

//Also peg the progress bar to it if it exists
if (instance_exists(obj_progressBar))	{
	var dy=y-yprevious;
	obj_progressBar.y+=dy;
}