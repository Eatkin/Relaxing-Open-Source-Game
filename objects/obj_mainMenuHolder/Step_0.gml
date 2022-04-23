/// @description

if ((!active and time!=1) or (active and time!=0))	{
	if (!active)
		time+=0.02;
	else
		time-=0.02;
	/*var c1 = 1.70158;
	var c3 = c1 + 1;
	xx=c3*power(time,3)-c1*power(time,2);*/
	
	var c1 = 1.70158;
	var c2 = c1 * 1.525;

	//Ease in and out
	xx=(time<0.5)	?	(power(2*time,2)*((c2+1)*2*time-c2))*0.5	:	(power(2*time-2,2)*((c2+1)*(time*2-2)+c2)+2)*0.5;
	var _x=xx;		//To pass to the child
	for (var i=0; i<array_length(child); i+=1)
		with (child[i])
			x=xstart-room_width*_x;
}

//If we've finished easing, set menus as active again
if (time==0 and !obj_menuManager.menusActive and obj_menuManager.currentMenu=Menu.Main)
	obj_menuManager.menusActive=true;