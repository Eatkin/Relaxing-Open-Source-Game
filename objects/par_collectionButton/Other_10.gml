/// @description DO NOTHING AT THE MOMENT

//This needs to load the text file name into a global variable so when we go to the game room it knows what text to load
global.text=myFile;
obj_collectionMenuHolder.direction=-1;

var fade=instance_create_layer(x,y,"hud",obj_fadeToBlack);
fade.targetRoom=rm_game;

with (obj_menuManager)	{
	menusActive=false;
	currentMenu=Menu.None;
}