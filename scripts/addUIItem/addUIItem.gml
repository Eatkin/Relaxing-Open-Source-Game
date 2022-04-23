function addUIItem() {
	var name=argument[0];
	var cost=argument[1];

	var unlocked=false;
	var active=false;

	if (argument_count>2)
		unlocked=argument[2];
	if (argument_count>3)
		active=argument[3];
	
	//Resize grid
	var height=ds_grid_height(global.UIShop);
	var width=ds_grid_width(global.UIShop);
	ds_grid_resize(global.UIShop,width,height+1);

	global.UIShop[# Shop.Name,				height]=name;
	global.UIShop[# Shop.Cost,				height]=cost;
	global.UIShop[# Shop.Purchased,			height]=unlocked;
	global.UIShop[# Shop.Active,			height]=active;
	global.UIShop[# Shop.Max+UIShop.Offset, height]=height;


}
