function scr_sound()
{
	var snd = audio_play_sound(argument[irandom(argument_count - 1)], 1, false);
	audio_sound_gain(snd, global.soundVolume, 0);
	return snd;
}
function scr_music(_snd, _loopBegin = 0, _loopEnd = undefined)
{
	var _als = instance_create(0, 0, obj_musicLoopManager);
	global.music = audio_play_sound(_snd, 10, true);
	audio_sound_gain(global.music, global.musicVolume, 0);
	with (_als)
	{
		Audio = global.music;
		LoopBegin = _loopBegin;
		LoopEnd = _loopEnd;
	}
	return global.music;
}
function scr_soundloop(_snd, _loopBegin = 0, _loopEnd = undefined)
{
	var _als = instance_create(0, 0, obj_musicLoopManager);
	var _music = audio_play_sound(_snd, 10, true);
	audio_sound_gain(_music, global.musicVolume, 0);
	with (_als)
	{
		Audio = _music;
		LoopBegin = _loopBegin;
		LoopEnd = _loopEnd;
		Transition_delay = 0;
	}
	return _music;
}
function audio_stop_all_music()
{
	audio_stop_sound(global.music);
}
