function playSound(argument0) {
	//Plays a sound with variable pitch

	var snd=audio_play_sound(argument0,0,false);

	var pitchVariation=0.1;

	var pitch=1+(random(pitchVariation)-pitchVariation*0.5);

	audio_sound_pitch(snd,pitch);
	audio_sound_gain(snd,global.soundVolume*global.soundOn,0);

	return snd;


}
