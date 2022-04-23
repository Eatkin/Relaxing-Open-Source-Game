/// @description

alpha=0.5*(1-power(1-min(1,timer),4));

var stepSize=0.05;
if (global.pause)
	timer=min(1,timer+stepSize);
else	{
	timer=max(0,timer-stepSize);
	if (timer==0)
		instance_destroy();
}
