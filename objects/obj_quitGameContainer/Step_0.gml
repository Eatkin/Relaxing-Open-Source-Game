/// @description

//easing
var factor=0;

if (timer<0.5)
	factor=4*power(timer,3);
else
	factor=1-power(-2*timer+2,3)*0.5;

alpha=factor*0.5;

y=ystart-factor*room_height;
var len=array_length_1d(child);
for (var i=0; i<len; i+=1)
	with (child[i])
		y=ystart-factor*room_height;

if (easingIn and timer<1)
	timer+=0.05;
if (!easingIn)	{
	timer-=0.05;
	if (timer<=0)	{
		for (var i=0; i<len; i+=1)
			with (child[i])
				instance_destroy();
				
		instance_destroy();
	}
}