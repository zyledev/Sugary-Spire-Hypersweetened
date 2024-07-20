if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (!place_meeting(x, y + 1, obj_solid))
			instance_destroy(obj_tutorialtrap);
	}
}
