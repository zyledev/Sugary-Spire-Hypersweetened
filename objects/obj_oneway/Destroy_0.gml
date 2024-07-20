if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (7)
	{
		with (instance_create(x + (image_xscale * 32), y + 32, obj_debris))
			sprite_index = spr_bigdebris;
	}
	with (instance_create(x + (image_xscale * 64), y + 32, obj_debris))
		sprite_index = spr_bigdebrisBandage;
	if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
	{
		audio_stop_sound(sound_destroyblock1);
		audio_stop_sound(sound_destroyblock2);
	}
	scr_sound(choose(sound_destroyblock1, sound_destroyblock1));
	ds_list_add(global.saveroom, id);
}
if (instance_exists(solidid))
{
	with (solidid)
		instance_destroy();
}
