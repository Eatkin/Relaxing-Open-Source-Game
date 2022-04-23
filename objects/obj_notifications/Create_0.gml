/// @description

//This used for determining how long to keep notifications on screen
notificationTimerMax=300;
notificationTimer=0;

var padding=16;
textX=-room_width+padding;
textXStart=textX;
textY=padding*0.5;

//This used to ease in and out
timer=0;
hrepeats=1;

textQueue=ds_queue_create();
text="";

//Determines what icon to draw - seems annoying but this keeps everything in sync
typeQueue=ds_queue_create();
type=Type.Music;