function scr_enemy_walk()
{
	var _movespeed = grounded ? (movespeed + (clamp(global.stylethreshold, 0, 3.25) * sign(movespeed))) : 0;
	if (grounded || ((grounded && !place_meeting(x, y, obj_platform)) || !place_meeting(x, y, obj_cottonplatform)))
	{
		hsp = image_xscale * _movespeed;
	}
	image_speed = 0.35 + (global.stylethreshold * 0.05);
	if (!roaming)
	{
		if (grounded || ((grounded && !place_meeting(x, y, obj_platform)) || !place_meeting(x, y, obj_cottonplatform)))
		{
			hsp = 0;
			state = baddiestates.idle;
			image_index = 0;
		}
	}
	if (grounded || ((grounded && !place_meeting(x, y, obj_platform)) || !place_meeting(x, y, obj_cottonplatform)))
		sprite_index = walkspr;
	else
	{
		sprite_index = idlespr;
		state = baddiestates.idle;
	}
	if (scr_solid(x + image_xscale, y) && !scr_slope_ext(x + image_xscale, y))
	{
		if (object_index == obj_knight)
		{
			state = confectistates.appear;
			hsp = 0;
		}
		else
		{
			image_xscale *= -1;
			hsp = 0;
		}
	}
	with (instance_place(x + sign(image_xscale), y, obj_hallway))
	{
		var backtoroom = -sign(image_xscale);
		if (sign(other.image_xscale) != backtoroom)
		{
			with (other.id)
			{
				if (object_index == obj_knight)
				{
					state = confectistates.appear;
					hsp = 0;
				}
				else
				{
					image_xscale *= -1;
					hsp = 0;
				}
			}
		}
	}
	if (!scr_solid(x + (image_xscale * 15), y + 31))
	{
		if (grounded && movespeed > 0)
		{
			if (object_index == obj_knight)
			{
				state = confectistates.appear;
				hsp = 0;
			}
			else if (object_index == obj_sluggy && (scr_solid(x + (image_xscale * 15), y + 32) || scr_solid(x + (image_xscale * 15), y + 64) || scr_solid(x + (image_xscale * 15), y + 79)))
				vsp = -3;
			else
			{
				image_xscale *= -1;
				hsp = 0;
			}
		}
	}
}
