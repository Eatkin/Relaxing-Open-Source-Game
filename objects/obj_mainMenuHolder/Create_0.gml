/// @description

child[0]=obj_startButton;
child[1]=obj_statsButton;
child[2]=obj_shoppingButton;
child[3]=obj_optionsButton;
child[4]=obj_mainContainer;
child[5]=obj_achievementsButton;
var n=6;
if (instance_exists(obj_quitButton))	{
	child[n]=obj_quitButton;
	n+=1;
}
	
child[n]=obj_infoButton;
	
active=true;
xx=0;
time=0;