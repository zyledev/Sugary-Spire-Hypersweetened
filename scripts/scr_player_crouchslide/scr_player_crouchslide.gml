function scr_player_crouchslide()
{
	hsp = xscale * movespeed;
	if (movespeed >= 0 && !scr_slope() && grounded)
		movespeed -= 0.2;
	mask_index = spr_crouchmask;
	if (input.key_mach.pressed && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
	{
		switch (character)
		{
			default:
				sprite_index = spr_player_rollgetup;
				image_index = 0;
				mach2 = 35;
				state = states.mach2;
				if (movespeed < 10)
					movespeed = 10;
				break;
			case "N":
				sprite_index = spr_pizzano_mach2;
				image_index = 0;
				state = states.machpizzano;
				break;
		}
	}
	if (movespeed <= 0 && (!scr_slope() || scr_solid(x + xscale, y, true)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = states.normal;
		movespeed = 0;
		mach2 = 0;
		crouchslideAnim = true;
		image_index = 0;
		crouchAnim = true;
		start_running = true;
		alarm[4] = 14;
	}
	if (scr_solid(x + xscale, y, true) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		movespeed = 0;
		state = states.bump;
		hsp = xscale * -2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		machslideAnim = true;
		machhitAnim = false;
		instance_create(x + (xscale * 10), y + (xscale * 10), obj_bumpeffect);
	}
	var _xscale = xscale;
	if (place_meeting(x, y + 1, obj_slope))
	{
		with (instance_place(x, y + 1, obj_slope))
		{
			var slope_acceleration = abs(image_yscale) / abs(image_xscale);
			if (_xscale == sign(image_xscale))
			{
				if (other.movespeed > 0)
					other.movespeed -= (0.25 * slope_acceleration);
				else
				{
					other.movespeed = 0;
					other.xscale = -sign(image_xscale);
				}
			}
			else if (_xscale == -sign(image_xscale))
			{
				if (other.movespeed < 18)
					other.movespeed += (0.25 * slope_acceleration);
			}
		}
	}
	image_speed = 0.35;
}
