function addFontItem() {
	var name=argument[0];
	var cost=argument[1];
	var fontRef=argument[2];

	var unlocked=false;
	var active=false;

	if (argument_count>3)
		unlocked=argument[3];
	if (argument_count>4)
		active=argument[4];
	
	//Resize grid
	var height=ds_grid_height(global.FontShop);
	var width=ds_grid_width(global.FontShop);
	ds_grid_resize(global.FontShop,width,height+1);

	global.FontShop[# Shop.Name,				height]=name;
	global.FontShop[# Shop.Cost,				height]=cost;
	global.FontShop[# Shop.Purchased,			height]=unlocked;
	global.FontShop[# Shop.Active,				height]=active;
	global.FontShop[# Shop.Max+FontShop.Ref,	height]=fontRef;


}
