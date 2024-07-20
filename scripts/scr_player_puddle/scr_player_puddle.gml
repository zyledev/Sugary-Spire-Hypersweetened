function scr_player_puddle()
{
	hsp = xscale * movespeed;
	if (scr_solid(x + xscale, y) && !scr_slope_ext(x + xscale, y + 1) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
	{
		instance_create(x, y, obj_bangeffect);
		xscale = -xscale;
		sprite_index = spr_player_outofcontrolfall;
	}
	if (sprite_index == spr_player_slipnslidestart || sprite_index == spr_player_outofcontrolfall)
	{
		if ((grounded && vsp > -1) && !place_meeting(x + 1, y, obj_destructibles) && !place_meeting(x, y + 1, obj_metalblock))
		{
			if (sprite_index == spr_player_slipnslidestart)
			{
				sprite_index = spr_player_outofcontrolfall;
				image_index = 0;
				image_speed = 0.35;
				vsp = -7;
				movespeed /= 1.2;
				instance_create(x, y, obj_bangeffect);
			}
			else
			{
				sprite_index = spr_player_slipnslideend;
				image_index = 0;
				image_speed = 0.35;
			}
		}
	}
	else if (sprite_index == spr_player_slipnslideend)
	{
		image_speed = 0.35;
		movespeed -= 0.5;
		if (movespeed <= 0)
			state = states.normal;
		if (!grounded)
			sprite_index = spr_player_outofcontrolfall;
	}
	if (animation_end() && (sprite_index == spr_player_slipnslidestart || sprite_index == spr_player_slipnslideend))
		image_speed = 0;
	else if (sprite_index == spr_player_outofcontrolfall)
		image_speed = clamp(movespeed / 15, 0.3, 1) * 0.6;
	else
		image_speed = 0.35;
}
