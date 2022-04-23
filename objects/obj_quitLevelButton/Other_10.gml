/// @description

//Create dialogue
//Also when you do this don't forget that one thing
//You can't PAUSE while this dialogue is open

if (!instance_exists(obj_quitGameContainer))
	instance_create_layer(0,0,layer,obj_quitGameContainer);
	
global.pause=false;