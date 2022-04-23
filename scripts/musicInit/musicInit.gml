function musicInit() {
	musicNames=ds_map_create();
	musicPlaylist=ds_list_create();
	
	//Now the tedious bit, we'll have to manually set all the song names and artists
	artist="Mark Mauer";
	addSong(MorningCoffee,		"Morning Coffee",	artist);
	addSong(NoPressure,			"No Pressure",		artist);
	addSong(Recliner,			"Recliner",			artist);

	shuffleMusic();

	musicPlaying=noone;
	songPlayingIndex=0;			//The index on the ds list of what's playing

	if (audio_sound_is_playable(musicPlaylist[| songPlayingIndex]))	{
		var song=musicPlaylist[| songPlayingIndex];
		musicPlaying=audio_play_sound(song,0,false);
		audio_sound_gain(musicPlaying,global.musicVolume*global.musicOn*0.5,0);


		//Queue text
		var songNameText=ds_map_find_value(musicNames,song);
		if (global.musicOn and global.notifications)
			with (obj_notifications)	{
				ds_queue_enqueue(textQueue,songNameText);
				ds_queue_enqueue(typeQueue,Type.Music);
			}
	}


}
