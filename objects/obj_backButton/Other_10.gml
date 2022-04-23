/// @description

var targetMenu=Menu.Main;

switch (owner)	{
	case obj_libraryMenuHolder:
	case obj_shopMenuHolder:
	case obj_achievementManagerHolder:
		owner.direction=1;
		break;
		
	case obj_collectionMenuHolder:
		targetMenu=Menu.TextsLibrary;
		break;
		

	//Save when closing options
	case obj_optionsPanel:
		saveGame();
		break;
		
	case obj_shopCategoryMenuHolder:
		targetMenu=Menu.Shop;
		break;
	case obj_achievementBox:
		targetMenu=Menu.Achievements;
		break;
}

with (obj_menuManager)	{
	menusActive=false;
	currentMenu=targetMenu;
}