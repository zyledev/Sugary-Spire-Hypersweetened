if (PauseMusic != -4)
{
	global.PAUSEfadeoff = audio_sound_get_track_position(PauseMusic);
	audio_stop_sound(PauseMusic);
}
if (room == realtitlescreen && instance_exists(obj_mainfartselect))
	obj_mainfartselect.alarm[0] = 3;
if (instance_exists(obj_pause))
{
	obj_pause.alarm[0] = 3;
	obj_pause.key_jump = false;
}
