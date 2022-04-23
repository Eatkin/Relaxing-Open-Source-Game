/// @description

if ((!active and time!=0) or (active and time!=1))	{
	if (!active)
		time-=0.02;
	else
		time+=0.02;
	
	var c1 = 1.70158;
	var c2 = c1 * 1.525;

	//Ease in and out
	var factor=(time<0.5)	?	(power(2*time,2)*((c2+1)*2*time-c2))*0.5	:	(power(2*time-2,2)*((c2+1)*(time*2-2)+c2)+2)*0.5;
	x=xstart-room_width*factor;
	for (var i=0; i<array_length_1d(child); i+=1)
		with (child[i])
			x=xstart-room_width*factor;
}

//If we've finished easing, set menus as active again
if (time==1 and !obj_menuManager.menusActive and obj_menuManager.currentMenu=Menu.Options)
	obj_menuManager.menusActive=true;