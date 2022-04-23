/// @description

global.musicOn^=1;

with (obj_music)	{
	audio_sound_gain(musicPlaying,global.musicOn*global.musicVolume*0.5,0);
}