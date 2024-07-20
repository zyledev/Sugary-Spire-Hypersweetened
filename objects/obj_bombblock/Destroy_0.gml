if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x + 32, y + 32, obj_bombblockdebris);
	instance_create(x + 32, y + 32, obj_bombblockdebris);
	instance_create(x + 32, y + 32, obj_bombblockdebris);
	instance_create(x + 32, y + 32, obj_bombblockdebris);
	scr_sound(sound_metaldestroy);
	ds_list_add(global.saveroom, id);
}
