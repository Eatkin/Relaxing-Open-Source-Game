/// @description

//We can set direction=-1 to ease the menu to the LEFT when inactive

if ((!active and time!=0) or (active and time!=1))	{
	//Time tends towards 1 when active, towards 0 otherwise
	//Because our xstart pos is already off screen!
	if (active)
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
	var dir=direction;
	for (var i=0; i<array_length_1d(child); i+=1)
		with (child[i])	{
			//If dir=-1, it basically acts as if xstart is 2 screens to the left
			if (dir==1)
				x=xstart-room_width*_x;
			else
				x=xstart+room_width*(_x-2);
		}
}

if (scrolling and scrollTimer!=1)	{
	scrollTimer+=0.02;
	
	//Calculate the esaing factor
	var factor=0;
	if (scrollTimer<0.5)
		factor=4*power(scrollTimer,3);
	else
		factor=1-power(-2*scrollTimer+2,3)*0.5;
		
	//Now we need to ease between ystart+page*room_height and ystart+targetPage*room_height
	//So y=ystart+page*roomheight+(targetPage-page)*room_height*factor?
	
	var arrayLength=array_length_1d(child);
	//Save these to pass to the child
	var pg=page;
	var tpg=targetPage;
	for (var i=0; i<arrayLength; i+=1)	{
		with (child[i])	{
			y=ystart-(pg-1)*room_height-(tpg-pg)*room_height*factor;
			//back button won't move
			if (object_index=obj_backButton)
				y=ystart;
		}
	}
}

if (scrolling and scrollTimer==1)	{
	scrolling=false;
	page=targetPage;
	scrollTimer=0;
}

if (time==1 and !obj_menuManager.menusActive)
	obj_menuManager.menusActive=true;