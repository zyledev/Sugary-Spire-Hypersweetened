if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_poofeffect);
	with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_sausageman_dead))
		sprite_index = other.deadSpr;
	ds_list_add(global.saveroom, id);
}
