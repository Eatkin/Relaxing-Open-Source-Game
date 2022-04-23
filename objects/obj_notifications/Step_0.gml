/// @description

notificationTimer=max(0,notificationTimer-1);

//If we have the text box off to the left and there's text waiting to show, take the queue head and dequeue the top text
if (!ds_queue_empty(textQueue) and timer==0)	{
	//Get the latest text
	text=ds_queue_head(textQueue);
	ds_queue_dequeue(textQueue);
	
	//Determine whether it's achievement or music
	type=ds_queue_head(typeQueue);
	ds_queue_dequeue(typeQueue);
	
	//Check if multiple musics are queued and if there are skip down the queue to find the bottom one (not perfect but ds queues are absolutely terrible, make sure you never use them again)
	while (type==Type.Music and !ds_queue_empty(typeQueue))	{
		if (ds_queue_head(typeQueue)==Type.Music)	{
			type=ds_queue_head(typeQueue);
			ds_queue_dequeue(typeQueue);
			text=ds_queue_head(textQueue);
			ds_queue_dequeue(textQueue);
		}
		else
			break;
	}
	
	//Then set timers and determine hrepeats and stuff
	notificationTimer=notificationTimerMax;
	draw_set_font(fnt_consolasXSmall);
	var padding=11;
	var sWidth=string_width(text)+padding*2+16;		//Add room for icons and padding pls
	hrepeats=ceil((sWidth-22)/16);
	
	//Play a notification opening sound
	playSound(notificatio);
}

if ((notificationTimer>0 and timer!=1) or (notificationTimer==0 and timer!=0))	{
	//Play a sound if we're just closing
	if (notificationTimer==0 and timer==1)
		playSound(notifClose);
		
	
	if (notificationTimer>0)
		timer+=0.02;
	else
		timer-=0.02;
		
	//Easing factor
	var factor=0;
	if (timer<0.5)
		factor=4*power(timer,3);
	else
		factor=1-power(-2*timer+2,3)*0.5;
		
	textX=textXStart+room_width*factor;

}