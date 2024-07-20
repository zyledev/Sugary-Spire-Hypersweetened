with (instance_place(x, y, obj_collectablebox))
{
	if (ds_list_find_index(global.saveroom, id) == -1 && !activated)
	{
		other.collectvanish = true;
		other.collectboxid = id;
		other.x = -200;
		other.y = -200;
		in_the_void = true;
	}
}
if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
