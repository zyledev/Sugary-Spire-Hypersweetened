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
		if (object_index == obj_officerwhoopiepie)
		{
			if (state != baddiestates.idle && state != baddiestates.walk)
			{
				hitboxcreate = false;
				instance_destroy(other.id);
			}
		}
		if (obj_player.state == states.mach3)
		{
			hitboxcreate = false;
			instance_destroy(other.id);
		}
	}
}
