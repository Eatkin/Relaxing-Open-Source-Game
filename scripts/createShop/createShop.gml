function createShop() {
	//Okay basically we need to add and populate sub menus, which have different properties making this difficult to make modular
	//Then we make a list of shop items which are linked to these sub menus
	//Each sub menu needs to contain it's cost, whether it has been purchased and whether it is currently active
	//I'll add a load of scripts and enums for automation anyway

	global.UIShop=ds_grid_create(Shop.Max+UIShop.Max,0);
	global.BGShop=ds_grid_create(Shop.Max+BGShop.Max,0);
	global.FontShop=ds_grid_create(Shop.Max+FontShop.Max,0);
	global.miscShop=ds_grid_create(Shop.Max,0);
	/*UI shop - it has a name, an offset (integer) because it's going to all draw using draw_sprite_part or draw_sprite(subimg+3*offset)
	That's pretty much enough actually, then we need cost, purchase status and active status
	*/
	addUIItem("Yellow on Green",	10,	true,	true);
	addUIItem("Green on Yellow",	10);
	addUIItem("Icy Blue",			20);
	addUIItem("Parchment",			40);
	addUIItem("Crappy UI",			100);


	//BG Shop, requires name, cost, type (enum) and reference (either colour or sprite reference)
	addBackgroundItem("Fantastic Forest",		0,BackgroundStyle.Stretched,	spr_forestBackground, true, true);
	addBackgroundItem("Amazing Aqua",			0,BackgroundStyle.BlockColour,	c_aqua, true, false);
	addBackgroundItem("Lovely Lime",			5,BackgroundStyle.BlockColour,	c_lime);
	addBackgroundItem("Maroon",					5,BackgroundStyle.BlockColour,	c_maroon);
	addBackgroundItem("Outlandish Olive",		5,BackgroundStyle.BlockColour,	c_olive);
	addBackgroundItem("Super Silver",			5,BackgroundStyle.BlockColour,	c_silver);
	addBackgroundItem("Blackout",				10,BackgroundStyle.BlockColour,	c_black);
	addBackgroundItem("White Washed",			10,BackgroundStyle.BlockColour,	c_white);
	addBackgroundItem("Meaningful Mountains",	30,BackgroundStyle.Stretched,spr_mountainBackground);
	addBackgroundItem("Hortative Hangar",		50,BackgroundStyle.Stretched,spr_hangarBackground);
	addBackgroundItem("Glamorous Grunge",		50,BackgroundStyle.Stretched,spr_grungeBackground);


	//Font shop, requires name, cost, reference
	addFontItem("Consolas",				0,	fnt_consolas,	true,	true);
	addFontItem("Impact",				10,	fnt_impact);
	addFontItem("Trebuchet",			10,	fnt_trebuchet);
	addFontItem("Rockwell",				10,	fnt_rockwell);
	addFontItem("Jokerman",				50,	fnt_jokerman);
	addFontItem("Chiller",				50,	fnt_chiller);
	addFontItem("Comic Sans",			80,	fnt_comicSans);


	//Misc
	addMiscItem("Show progress bar",50);
	addMiscItem("DisOmikron screams",200);
	addMiscItem("Extreme screen shake", 200);

	global.shopContainer=ds_grid_create(ShopContainer.Max,0);
	addShopMenuItem("UI Style",		global.UIShop);
	addShopMenuItem("Background",	global.BGShop);
	addShopMenuItem("In-Game Font",	global.FontShop);
	addShopMenuItem("Miscellaneous",global.miscShop);


}
