function loadGame() {
	var _location="save.txt";
	if (isBrowser())
		_location=working_directory+"save.txt";
	
	//Check file exists, if not create it
	if (!file_exists(_location))	{
		var file=file_text_open_write(_location);
		file_text_close(file);
	}

	var file=file_text_open_read(_location);

	if (file_text_eof(file))	{
		file_text_close(file);
		return false;
	}

	//First is the completion map
	var _cstring=file_text_read_string(file);
	file_text_readln(file);
	var _cmap=ds_map_create();
	ds_map_read(_cmap,_cstring);	//We've loaded the map from the save data into _cmap

	//Now we want to loop through the current global.completion map and search the _cmap for equivalent entries
	//For some reason I hate myself so there are multiple grids called global.collection[i]
	//So we need to open up each collection and loop through each item in each collection
	//Good lord way to make it hard for myself
	var _collength=array_length_1d(global.collection);
	for (var i=0; i<_collength; i+=1)	{
		var _grid=global.collection[i];
		var _liblength=ds_grid_height(_grid);
	
		for (var j=0; j<_liblength; j+=1)	{
			//Now find the file name, look in the _cmap and copy the value to the global.completion map
			var fname=_grid[# LiteratureContent.Text, j];
			var status=_cmap[? fname];
		
			//One note - if it's not in the saved map (because e.g. I've added new texts), it will skip over it
			if (!is_undefined(status))
				global.completion[? fname]=status;
		}
	}

	//Now load in stats
	//This is easier, just destroy and re-make
	ds_map_destroy(global.statsMap);
	global.statsMap=ds_map_create();
	var _sstring=file_text_read_string(file);
	file_text_readln(file);
	ds_map_read(global.statsMap,_sstring);

	//Next we load in a list of globals and set them
	var _list=ds_list_create();
	var _gstring=file_text_read_string(file);
	file_text_readln(file);
	ds_list_read(_list,_gstring);

	//This just loops through in an annoying arbitrary manner
	var _length=ds_list_size(_list);
	for (var i=0; i<_length; i+=1)	{
		var _val=ds_list_find_value(_list,i);
		switch (i)	{
			case 0:
				global.coins=_val;
				break;
			case 1:
				global.showCapsIndicator=_val;
				break;
			case 2:
				global.UIOffset=_val;
				break;
			case 3:	
				global.BGOffset=_val;
				break;
			case 4:
				global.fontOffset=_val;
				break;
			case 5:
				global.miscShopBitmasks=_val;
				break;
			case 6:
				global.achievementBitmasks=_val;
				break;
			case 7:
				global.musicVolume=_val;
				break;
			case 8:
				global.soundVolume=_val;
				break;
			case 9:
				global.musicOn=_val;
				break;
			case 10:
				global.soundOn=_val;
				break;
			case 11:
				global.ignoreCase=_val;
				break;
			case 12:
				global.manualLineBreak=_val;
				break;
			case 13:
				global.addSpaces=_val;
				break;
			case 14:
				global.notifications=_val;
				break;
			case 15:
				global.screenShake=_val;
				break;
		}
	}

	//Now just need to load in shop data
	//Wwe only need shop.purchased and shop.active from this grid, nothing else
	//UI shop
	var _uistr=file_text_read_string(file);
	file_text_readln(file);
	var _uitemp=ds_grid_create(0,0);
	ds_grid_read(_uitemp,_uistr);
	var grid=_uitemp;
	var height=ds_grid_height(grid);
	for (var i=0; i<height; i+=1)	{
		var _purch=grid[# Shop.Purchased, i];
		var _act=grid[# Shop.Active, i];
		global.UIShop[# Shop.Purchased, i] =_purch;
		global.UIShop[# Shop.Active, i]=_act;
	}

	//Then just repeat this for BGShop, FontShop and miscShop
	var _bgstr=file_text_read_string(file);
	file_text_readln(file);
	var _bgtemp=ds_grid_create(0,0);
	ds_grid_read(_bgtemp,_bgstr);
	var grid=_bgtemp;
	var height=ds_grid_height(grid);
	for (var i=0; i<height; i+=1)	{
		var _purch=grid[# Shop.Purchased, i];
		var _act=grid[# Shop.Active, i];
		global.BGShop[# Shop.Purchased, i] =_purch;
		global.BGShop[# Shop.Active, i]=_act;
		if (_act)	{
			var style=global.BGShop[# Shop.Max+BGShop.Type, i];
			var bgRef=global.BGShop[# Shop.Max+BGShop.Ref, i];
			with (obj_background)
				loadBackground(style,bgRef);
		}
	}

	var _fntstr=file_text_read_string(file);
	file_text_readln(file);
	var _fnttemp=ds_grid_create(0,0);
	ds_grid_read(_fnttemp,_fntstr);
	var grid=_fnttemp;
	var height=ds_grid_height(grid);
	for (var i=0; i<height; i+=1)	{
		var _purch=grid[# Shop.Purchased, i];
		var _act=grid[# Shop.Active, i];
		global.FontShop[# Shop.Purchased, i] =_purch;
		global.FontShop[# Shop.Active, i]=_act;
	
		if (_act)
			global.font=grid[# Shop.Max+FontShop.Ref, i];
	}

	var _mscstr=file_text_read_string(file);
	file_text_readln(file);
	var _msctemp=ds_grid_create(0,0);
	ds_grid_read(_msctemp,_mscstr);
	var grid=_msctemp;
	var height=ds_grid_height(grid);
	for (var i=0; i<height; i+=1)	{
		var _purch=grid[# Shop.Purchased, i];
		var _act=grid[# Shop.Active, i];
		global.miscShop[# Shop.Purchased, i] =_purch;
		global.miscShop[# Shop.Active, i]=_act;
	}

	//Clean up
	ds_map_destroy(_cmap);
	ds_list_destroy(_list);
	ds_grid_destroy(_uitemp);
	ds_grid_destroy(_bgtemp);
	ds_grid_destroy(_fnttemp);
	ds_grid_destroy(_msctemp);

	file_text_close(file);


}
