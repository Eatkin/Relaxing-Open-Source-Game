function addMiscItem() {
	var name=argument[0];
	var cost=argument[1];

	var unlocked=false;
	var active=false;

	/*
	None unlocked or active
	if (argument_count>3)
		unlocked=argument[3];
	if (argument_count>4)
		active=argument[4];*/
	
	//Resize grid
	var height=ds_grid_height(global.miscShop);
	var width=ds_grid_width(global.miscShop);
	ds_grid_resize(global.miscShop,width,height+1);

	global.miscShop[# Shop.Name,				height]=name;
	global.miscShop[# Shop.Cost,				height]=cost;
	global.miscShop[# Shop.Purchased,			height]=unlocked;
	global.miscShop[# Shop.Active,				height]=active;


}
