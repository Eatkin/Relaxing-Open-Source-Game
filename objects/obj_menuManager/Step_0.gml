/// @description

//This will idk make everything automatically ease in or out I think
obj_mainMenuHolder.active=(currentMenu==Menu.Main)					?	true	:	false;
	
obj_optionsPanel.active=(currentMenu==Menu.Options)					?	true	:	false;
obj_optionsPanel_2.active=(currentMenu==Menu.Options)					?	true	:	false;

obj_shopMenuHolder.active=(currentMenu==Menu.Shop)					?	true	:	false;

obj_shopCategoryMenuHolder.active=(currentMenu==Menu.ShopCategory)	?	true	:	false;
	
obj_libraryMenuHolder.active=(currentMenu==Menu.TextsLibrary)		?	true	:	false;

obj_achievementManagerHolder.active=(currentMenu==Menu.Achievements)	?	true	:	false;
	
	/*This resets all the positions but I'm changing that now because it snaps back but also doesn't make that much sense
if (currentMenu!=Menu.TextsLibrary)	{
	obj_libraryMenuHolder.active=false;
	//If menus are active we will return all stuff to it's initial position and reset page number to 1
	if (menusActive and currentMenu!=Menu.TextsCollection)			//Don't reset the menu on the collections screen, that wouldn't make sense
		with (obj_libraryMenuHolder)	{
			page=1;
			for (var i=0; i<array_length_1d(child); i+=1)
				with (child[i])
					y=ystart;
		}
				
	}
else
	obj_libraryMenuHolder.active=true;*/
	
obj_collectionMenuHolder.active=(currentMenu==Menu.TextsCollection)	?	true	:	false;

obj_statsPanel.active=(currentMenu==Menu.Stats)	?	true	:	false;

obj_achievementBox.active=(currentMenu==Menu.AchBox)	?	true	:	false;