/// @description

alpha=1-power(1-min(1,timer),4);

timer+=0.02;

if (timer>=1)
	room_goto(targetRoom);