/// @description DO NOTHING AT THE MOMENT

//We want to load up a box on demand that will display the name, description and relevant statistic

//Pass stuff to the achievement box
obj_achievementBox.achName=global.achievementGrid[# Achievements.Name, myRef];
obj_achievementBox.achDescription=global.achievementGrid[# Achievements.Description, myRef];

//Now check on the bitmasks if it's complete
var ach=power(2,myRef);
var achComplete=achievementIsComplete(ach);

obj_achievementBox.achieved=achComplete;

with (obj_menuManager)	{
	menusActive=false;
	currentMenu=Menu.AchBox;
}

obj_achievementManagerHolder.direction=-1;