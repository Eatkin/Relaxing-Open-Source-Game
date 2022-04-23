/// @description Setup collection menu

var myRef=gridRef;
with (obj_shopCategoryMenuHolder)	{
	gridRef=myRef;
	loadShopMenu();
}

with (obj_menuManager)	{
	menusActive=false;
	currentMenu=Menu.ShopCategory;
}

//Lerp this off to the left
with (obj_shopMenuHolder)
	direction=-1;