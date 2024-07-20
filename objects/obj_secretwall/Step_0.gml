if (place_meeting(x, y, obj_player) || (activated && mode != 0))
{
	secretalpha = approach(secretalpha, 0, 0.15);
	if (ds_list_find_index(global.saveroom, id) == -1)
	{
		ds_list_add(global.saveroom, id);
		activated = true;
	}
}
else if (mode == 0)
	secretalpha = approach(secretalpha, 1, 0.15);
