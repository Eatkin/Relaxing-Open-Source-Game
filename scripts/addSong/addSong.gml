function addSong(argument0, argument1, argument2) {
	var song=argument0;
	var songName=argument1;
	var artistName=argument2;

	var conc=songName+" by "+artistName;

	ds_map_set(musicNames,song,conc);
	ds_list_add(musicPlaylist, song);


}
