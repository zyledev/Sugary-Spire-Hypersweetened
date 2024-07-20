if (other.state != states.bombpep && other.Dashpad_buffer <= 0)
{
	with (other)
	{
		if (state != states.Sjumpprep && state != states.minecart && state != states.crouch && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
		{
			if (state == states.mach3 && xscale == sign(other.image_xscale))
				movespeed += 4;
			movespeed = clamp(movespeed, 12, 24);
			if (character == "P")
			{
				state = states.mach3;
				Dashpad_buffer = 25;
				sprite_index = spr_player_dashpad;
				xscale = sign(other.image_xscale);
				var try_y = 0;
				while (try_y <= 16)
				{
					if (scr_solid(x, other.y - try_y))
						try_y++;
					else
					{
						y = other.y - try_y;
						break;
					}
				}
				if (state != states.climbwall && !scr_solid(other.x, y))
					x = other.x;
				image_index = 0;
				vsp = 3;
				flash = true;
			}
			if (character == "N")
			{
				state = states.mach2;
				Dashpad_buffer = 10;
				state = states.machpizzano;
				Dashpad_buffer = 25;
				xscale = sign(other.image_xscale);
				try_y = 0;
				while (try_y <= 16)
				{
					if (scr_solid(x, other.y - try_y))
						try_y++;
					else
					{
						y = other.y - try_y;
						break;
					}
				}
				image_index = 0;
				flash = true;
			}
		}
		else if (state == states.minecart && sprite_get_bbox_bottom(mask_index) <= other.bbox_bottom)
		{
			movespeed++;
			movespeed = clamp(movespeed, 12, 15);
			flash = true;
			Dashpad_buffer = 25;
			xscale = sign(other.image_xscale);
			image_index = 0;
			sprite_index = spr_player_minecartfastland;
		}
	}
}
