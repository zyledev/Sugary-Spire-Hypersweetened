function scr_applejim_bash()
{
	if (grounded || (grounded && !place_meeting(x, y, obj_platform)))
	{
		if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
			hsp = image_xscale * movespeed;
		else if (place_meeting(x, y + 1, obj_railh))
			hsp = (image_xscale * movespeed) - 5;
		else if (place_meeting(x, y + 1, obj_railh2))
			hsp = (image_xscale * movespeed) + 5;
		else
			hsp = 0;
	}
	if (!roaming)
	{
		if (grounded || (grounded && !place_meeting(x, y, obj_platform)))
		{
			hsp = 0;
			state = states.normal;
			image_index = 0;
		}
	}
	if (grounded || (grounded && !place_meeting(x, y, obj_platform)))
		sprite_index = spr_applejim_charge;
	else
	{
		sprite_index = spr_applejim_charge;
		state = states.normal;
	}
	image_speed = 0.35;
	if ((scr_solid(x + 1, y) && image_xscale == 1) || (scr_solid(x - 1, y) && image_xscale == -1) || place_meeting(x + hsp, y, obj_hallway))
	{
		if (!place_meeting(x + sign(hsp), y, obj_slope))
			state = baddiestates.stun;
	}
	if (!(scr_solid(x + 15, y + 31) || place_meeting(x + 15, y + 31, obj_platform)))
	{
		if (image_xscale == 1 && movespeed > 0)
		{
			bashcooldown = 200;
			state = baddiestates.stun;
		}
	}
	if (!(scr_solid(x - 15, y + 31) || place_meeting(x - 15, y + 31, obj_platform)))
	{
		if (image_xscale == -1 && movespeed > 0)
		{
			bashcooldown = 200;
			state = baddiestates.stun;
		}
	}
	if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp < 0)
		hsp += 0.1;
	else if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp > 0)
		hsp -= 0.1;
}
