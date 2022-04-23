function addBackgroundItem() {
	var name=argument[0];
	var cost=argument[1];
	var bgtype=argument[2];
	var bgref=argument[3];

	var unlocked=false;
	var active=false;

	if (argument_count>4)
		unlocked=argument[4];
	if (argument_count>5)
		active=argument[5];
	
	//Resize grid
	var height=ds_grid_height(global.BGShop);
	var width=ds_grid_width(global.BGShop);
	ds_grid_resize(global.BGShop,width,height+1);

	global.BGShop[# Shop.Name,				height]=name;
	global.BGShop[# Shop.Cost,				height]=cost;
	global.BGShop[# Shop.Purchased,			height]=unlocked;
	global.BGShop[# Shop.Active,			height]=active;
	global.BGShop[# Shop.Max+BGShop.Type,	height]=bgtype;
	global.BGShop[# Shop.Max+BGShop.Ref,	height]=bgref;


}
