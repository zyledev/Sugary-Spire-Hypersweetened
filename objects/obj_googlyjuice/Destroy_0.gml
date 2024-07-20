if (ds_list_find_index(global.baddieroom, id) == -1)
{
	scr_sound(sfx_glassbreak);
	with (instance_create(x, y, obj_puddle))
		vsp = -4;
}
event_inherited();
