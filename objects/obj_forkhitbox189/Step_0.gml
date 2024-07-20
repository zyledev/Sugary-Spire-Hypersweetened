if (!instance_exists(ID))
	instance_destroy();
if (instance_exists(ID))
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;
	with (ID)
	{
		if (object_index == obj_sluggy)
		{
			if (obj_sluggy.state == baddiestates.slugjump && obj_player.state != states.parry)
			{
				sluggyhitboxcreated = false;
				instance_destroy(other.id);
			}
		}
	}
}
