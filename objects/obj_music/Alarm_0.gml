/// @description

alarm[0]=60;

//If audio has stopped, we advance by one track
if (musicPlaying!=noone and !audio_is_playing(musicPlaying))	{
	//If the audio is not currently playable, don't try and skip the track
	if (!audio_sound_is_playable(musicPlaylist[| songPlayingIndex]))
		exit;
		
	songPlayingIndex+=1;
	
	//If we hit the end of the playlist, we shuffle the music
	if (ds_list_size(musicPlaylist)>=songPlayingIndex)	{
		shuffleMusic();
		songPlayingIndex=0;
	}
	
	var song=musicPlaylist[| songPlayingIndex];
	musicPlaying=audio_play_sound(song,0,false);
	audio_sound_gain(musicPlaying, global.musicVolume*0.5*global.musicOn,0);
	
	//Queue text
	var songNameText=ds_map_find_value(musicNames,song);
	if (global.musicOn and global.notifications)
		with (obj_notifications)	{
			ds_queue_enqueue(textQueue,songNameText);
			ds_queue_enqueue(typeQueue,Type.Music);
		}
		
	alarm[0]=360;			//Give a little extra time for music to start up
}
