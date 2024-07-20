if (ds_list_find_index(global.saveroom, id) != -1)
{
	has_changed = true;
	sprite_index = ds_list_find_value(global.saveroom, ds_list_find_index(global.saveroom, id) + 1);
}
