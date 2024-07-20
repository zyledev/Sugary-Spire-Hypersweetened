if (!instance_exists(ID) || (obj_player.state == states.mach3 || obj_player.state == states.pizzanoshoulderbash || obj_player.state == states.rocketfistpizzano || obj_player.state == states.minecart))
	instance_destroy();
if (instance_exists(ID))
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;
	with (ID)
	{
		switch (object_index)
		{
			case obj_knight:
				if (state != states.normal && state != baddiestates.walk)
				{
					hitboxcreate = false;
					instance_destroy(other.id);
				}
				break;
			case obj_sluggy:
				if (state != baddiestates.slugjump)
				{
					hitboxcreate = false;
					instance_destroy(other.id);
				}
				break;
			case obj_charger:
				if (state != baddiestates.charge && sprite_index != spr_banana_charge)
				{
					hitboxcreate = false;
					instance_destroy(other.id);
				}
				break;
			case obj_swedishfish:
				if (state != baddiestates.land)
				{
					hitboxcreate = false;
					instance_destroy(other.id);
				}
				break;
		}
	}
}
