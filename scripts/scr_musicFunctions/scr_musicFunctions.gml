function Music(_rooms, _song, _is_secret = false, _loopBegin = 0, _loopEnd = undefined) constructor
{
	music = _song;
	music_rooms = _rooms;
	loop_begin = _loopBegin;
	loop_end = _loopEnd;
	is_secret = _is_secret;
	position = 0;
}

function play_music(_song = obj_music.currently_playing)
{
	global.music = audio_play_sound(_song.music, 10, true);
	audio_sound_gain(global.music, global.musicVolume, 0);
}