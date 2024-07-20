var lay_id = layer_get_id("Backgrounds_spire");
var back_id = layer_background_get_id(lay_id);
layer_background_index(back_id, 1);
if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x + 16, y, obj_debris);
	instance_create(x + 16, y, obj_debris);
	instance_create(x + 16, y, obj_debris);
	instance_create(x + 16, y, obj_debris);
	if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
	{
		audio_stop_sound(sound_destroyblock1);
		audio_stop_sound(sound_destroyblock2);
	}
	scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
	ds_list_add(global.saveroom, id);
}
