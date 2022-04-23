/// @description

if (room!=rm_game or instance_exists(obj_levelEnd) or instance_exists(obj_quitGameContainer))
	exit;

global.pause^=1;

if (!instance_exists(obj_pauseOverlay))
	instance_create_layer(0,0,layer,obj_pauseOverlay);