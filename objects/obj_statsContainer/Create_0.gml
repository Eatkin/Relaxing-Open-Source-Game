/// @description

WPM=0;
accuracy=0;
mistakes=0;
points=0;

collapsed=false;

collapser=instance_create_layer(bbox_right+32,y,layer,obj_collapseStats);
collapser.owner=id;

hrepeats=22;
vrepeats=4;

//Move x
x=(room_width-hrepeats*16)*0.5;
collapser.x=x+(hrepeats*16)-32;