function getStat(argument0) {
	var statType=argument0;

	var map=global.statsMap;

	return ds_map_find_value(map,statType);


}
