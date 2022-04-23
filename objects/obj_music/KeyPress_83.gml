/// @description

if (keyboard_check(vk_control) and musicPlaying!=noone and audio_is_playing(musicPlaying))	{
	audio_stop_sound(musicPlaying);
	alarm[0]=1;		//Trigger alarm 0
}