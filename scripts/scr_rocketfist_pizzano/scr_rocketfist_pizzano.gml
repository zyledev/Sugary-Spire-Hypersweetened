function scr_rocketfist_pizzano()
{
	if (sprite_index == spr_pizzano_sjumpprepside)
	{
		vsp = 0;
		hsp = 0;
		move = 0;
		if (sprite_index == spr_pizzano_sjumpprepside && floor(image_index) == (image_number - 1))
		{
			image_index = 0;
			if (grounded)
				sprite_index = spr_pizzano_mach3;
			else
				sprite_index = spr_pizzano_sjumpside;
			movespeed = 12;
			flash = true;
		}
	}
	if (sprite_index != spr_pizzano_sjumpprepside)
	{
		if (!key_up && !key_down)
			vsp = 0;
		move = key_left + key_right;
		hsp = xscale * movespeed;
		if ((move != 0 && move != xscale) && movespeed > 1)
			movespeed -= 0.05;
		if ((move != 0 && move == xscale) && movespeed < 24)
			movespeed += 0.1;
		if (key_jump && grounded)
		{
			state = states.pizzanotwirl;
			vsp = -12;
		}
		if (key_up)
			vsp = -5;
		if (key_down)
			vsp = 5;
		if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles))
		{
			vsp = -6;
			movespeed = -6;
			sprite_index = spr_player_mach3hitwall;
			state = states.bump;
		}
		if (!grounded && hsp != 0 && sprite_index != spr_pizzano_sjumpside)
			sprite_index = spr_pizzano_sjumpside;
		if (key_slap2 && key_up && charged)
		{
			flash = true;
			alarm[0] = 240;
			image_index = 0;
			state = states.Sjump;
			sprite_index = spr_pizzano_sjumpprep;
		}
		if (key_down && grounded)
			sprite_index = spr_pizzano_crouchslide;
		else if (!key_down && grounded && hsp != 0)
			sprite_index = spr_pizzano_mach3;
	}
	image_speed = 0.35;
}
