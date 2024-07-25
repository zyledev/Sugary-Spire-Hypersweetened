pausedmusic = 0;
fadeoff = 0;
is_playing = true;
currently_playing = undefined;
room_found = false;
prev_song = {};
function Music(_rooms, _song, _loopBegin = 0, _loopEnd = undefined) constructor
{
	music = _song;
	music_rooms = _rooms;
	loop_begin = _loopBegin;
	loop_end = _loopEnd;
}

music_values =
{
	titlescreen : new Music([realtitlescreen], mu_title),
	hub : new Music([outer_room1, hub_room1], mu_hub),
	entryway : new Music([entryway_1], mu_waffle)
};
function play_music(_song = currently_playing)
{
	global.music = audio_play_sound(_song.music, 10, true);
	audio_sound_gain(global.music, global.musicVolume, 0);
	
}