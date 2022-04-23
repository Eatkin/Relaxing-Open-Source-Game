function saveGame() {
	var _location="save.txt";
	if (isBrowser())
		_location=working_directory+"save.txt";
	
	var file=file_text_open_write(_location);

	//Save which texts have been completed
	var _complete=ds_map_write(global.completion);
	file_text_write_string(file,_complete);
	file_text_writeln(file);

	//Save stats
	var _stats=ds_map_write(global.statsMap);
	file_text_write_string(file,_stats);
	file_text_writeln(file);

	//Save all these globals urgh
	var _list=ds_list_create();
	_list[| 0]=global.coins;
	_list[| 1]=global.showCapsIndicator;
	_list[| 2]=global.UIOffset;
	_list[| 3]=global.BGOffset;
	_list[| 4]=global.fontOffset;
	_list[| 5]=global.miscShopBitmasks;
	_list[| 6]=global.achievementBitmasks;
	_list[| 7]=global.musicVolume;
	_list[| 8]=global.soundVolume;
	_list[| 9]=global.musicOn;
	_list[| 10]=global.soundOn;
	_list[| 11]=global.ignoreCase;
	_list[| 12]=global.manualLineBreak;
	_list[| 13]=global.addSpaces;
	_list[| 14]=global.notifications;
	_list[| 15]=global.screenShake;

	var _options=ds_list_write(_list);
	file_text_write_string(file,_options);
	file_text_writeln(file);

	ds_list_destroy(_list);

	//These 4 are actually complex ds grids that I want particular things from, so I'll save them all and only load in the data I want
	var _ui=ds_grid_write(global.UIShop);
	var _bg=ds_grid_write(global.BGShop);
	var _fnt=ds_grid_write(global.FontShop);
	var _misc=ds_grid_write(global.miscShop);
	file_text_write_string(file,_ui);
	file_text_writeln(file);
	file_text_write_string(file,_bg);
	file_text_writeln(file);
	file_text_write_string(file,_fnt);
	file_text_writeln(file);
	file_text_write_string(file,_misc);

	file_text_close(file);


}
