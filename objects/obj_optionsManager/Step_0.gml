/// @description

//Scrolling
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
	
	//Now do the same thing with the options panels
	var obj=obj_optionsPanel;
	repeat (2)	{
		with (obj)	{
			y=ystart-(pg-1)*room_height-(tpg-pg)*room_height*factor;
			var arrayLength=array_length_1d(child);
			for (var i=0; i<arrayLength; i+=1)	{
				with (child[i])	{
					y=ystart-(pg-1)*room_height-(tpg-pg)*room_height*factor;
					//back button won't move
					if (object_index=obj_backButton)
						y=ystart;
				}
			}
		}
		
		obj=obj_optionsPanel_2;
	}
	
}

if (scrolling and scrollTimer==1)	{
	scrolling=false;
	page=targetPage;
	scrollTimer=0;
}