/// @description Pausing
if (!global.pause)
{
	alpha = 0;
	screenshot = sprite_create_from_surface(application_surface, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false, false, 0, 0)
	audio_pause_all();
	scr_sound(sound_pausescratch);
	global.pause = true;
	instance_deactivate_all(true);
	instance_activate_object(obj_screen);
	instance_activate_object(obj_pause);
	instance_activate_object(obj_rpc);
}
else
{
	alpha = 0;
	audio_stop_sound(mu_pause);
	if (sprite_exists(screenshot))
		sprite_delete(screenshot);
	screenshot = undefined;
	global.pause = false;
	instance_activate_all();
	audio_resume_all();
}

