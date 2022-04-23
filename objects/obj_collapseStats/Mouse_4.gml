/// @description

if (instance_exists(obj_levelEnd))
	exit;

owner.collapsed=owner.collapsed^1;

var snd=statsOpen;
if (owner.collapsed)
	snd=statsCollap;
	
playSound(snd);