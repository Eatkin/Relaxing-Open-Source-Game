function textIsUnlocked(argument0) {
	var fpath=argument0;

	return ds_map_find_value(global.unlockables,fpath);


}
