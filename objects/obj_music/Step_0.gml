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
