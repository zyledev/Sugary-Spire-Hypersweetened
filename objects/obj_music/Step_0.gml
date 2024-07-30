if (currently_playing != undefined)
{
	if (global.panic)
	{
		if (audio_is_playing(currently_playing.music) && currently_playing.music != mu_escape)
			audio_stop_sound(currently_playing.music);
		currently_playing = new Music([room], mu_escape);
		if (!audio_is_playing(currently_playing.music))
			play_music();
		exit;
	}
	else if (currently_playing.music == mu_escape && !global.panic)
	{
		// run the room start event to get the music
		event_perform(ev_other, ev_room_start);
		// if still escape play missing room song
		if (currently_playing.music == mu_escape)
			currently_playing = new Music([room], mu_void);
	}

	if (is_playing && !audio_is_playing(currently_playing.music))
		play_music();
	else if (!is_playing && audio_is_playing(currently_playing.music))
		audio_stop_sound(currently_playing.music);
		
	// loop through to kill all songs that arent currently playing
	struct_foreach(music_values, function(_name, _value)
	{
		if (audio_is_playing(_value.music) && _value != currently_playing)
			audio_stop_sound(_value.music)
	});
}
/*	
pausedmusic = global.music;

if (global.panic && !obj_pause.pause && room != timesuproom)
{
	if (!audio_is_playing(mu_escape))
	{
		audio_stop_all_music();
		scr_music(mu_escape);
		pausedmusic = mu_escape;
	}
}
else if (!global.panic && room == timesuproom)
	audio_stop_sound(global.music);

if (room != hub_room1 && room != outer_room2)
	fadeoff = audio_sound_get_track_position(global.music) / audio_sound_length(global.music);
else
	fadeoff = 0;
