/// @description Loop manager
if (currently_playing != undefined && is_playing)
{
	if (!is_undefined(currently_playing.loop_end) && audio_sound_get_track_position(currently_playing.music) >= (currently_playing.loop_end - 0.05))
		audio_sound_set_track_position(currently_playing.music, currently_playing.loop_begin);
	else if (audio_sound_get_track_position(currently_playing.music) >= (audio_sound_length(currently_playing.music) - 0.05))
		audio_sound_set_track_position(currently_playing.music, currently_playing.loop_begin);
}
