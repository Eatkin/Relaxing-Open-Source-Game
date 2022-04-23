/// @description Setup collection menu

var myRef=gridRef;
with (obj_collectionMenuHolder)	{
	gridRef=myRef;
	loadCollectionsMenu();
}

with (obj_menuManager)	{
	menusActive=false;
	currentMenu=Menu.TextsCollection;
}

//Lerp this off to the left
with (obj_libraryMenuHolder)
	direction=-1;