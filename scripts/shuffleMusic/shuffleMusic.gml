function shuffleMusic() {
	randomise();

	var _len=ds_list_size(musicPlaylist);
	var _last=ds_list_find_value(musicPlaylist, _len-1);

	//This shuffles, but makes sure it won't cause a song to repeat
	do	{
		ds_list_shuffle(musicPlaylist);
	}	until (ds_list_find_value(musicPlaylist, 0)!=_last);


}