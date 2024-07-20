function scr_enemy_charge()
{
	if (object_index == obj_swedishfish)
	{
		hsp = image_xscale * movespeed;
		if (place_meeting(x + hsp, y, obj_solid))
		{
			state = baddiestates.stun;
			stunned = 100;
		}
	}
	if (object_index == obj_charger)
	{
		hsp = image_xscale * movespeed;
		if (sprite_index != spr_banana_chargestart)
			movespeed = 8;
		else
			movespeed = 0;
		if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
			image_xscale *= -1;
	}
}
