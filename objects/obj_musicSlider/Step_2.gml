/// @description

if (x!=xprevious)	{
	var dx=xprevious-x;
	slider.minx-=dx;
	slider.maxx-=dx;
	slider.x-=dx;
}


if (y!=yprevious)	{
	var dy=yprevious-y;
	slider.y-=dy;
}