function scr_player_boxxedpep()
{
	mask_index = spr_crouchmask;
	key_particles = false;
	alarm[5] = 2;
	alarm[7] = 60;
	hurted = true;
	if (input.key_jump.pressed)
		input_buffer_jump = 0;
	if (!input.key_jump.check && !jumpstop && vsp < 0.5 && !stompAnim)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	if (sprite_index != spr_boxxedpep_intro)
	{
		move = -input.key_left.check + input.key_right.check;
		hsp = move * movespeed;
	}
	if (scr_solid(x + sign(hsp), y) && xscale == 1 && move == 1 && !place_meeting(x + 1, y, obj_slope))
		movespeed = 0;
	if (scr_solid(x + sign(hsp), y) && xscale == -1 && move == -1 && !place_meeting(x - 1, y, obj_slope))
		movespeed = 0;
	if (grounded && input_buffer_jump < 8 && vsp > 0 && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		scr_sound(sound_maximumspeedstop);
		instance_create(x, y, obj_highjumpcloud2);
		vsp = -11;
	}
	if (move != 0)
	{
		if (movespeed < 8)
			movespeed += 0.5;
		else if (floor(movespeed) == 8)
			movespeed = 8;
	}
	else
		movespeed = 0;
	if (movespeed > 8)
		movespeed -= 0.1;
	if (sprite_index == spr_boxxedpep_intro && floor(image_index) == (image_number - 1))
		sprite_index = spr_boxxedpep_idle;
	if (sprite_index != spr_boxxedpep_intro)
	{
		if (move != 0)
			xscale = move;
		if (grounded)
		{
			if (move != 0)
				sprite_index = spr_boxxedpep_walk;
			else
				sprite_index = spr_boxxedpep_idle;
		}
		else
			sprite_index = spr_boxxedpep_air;
	}
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		instance_create(x, y + 43, obj_cloudeffect);
	if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && !steppy)
	{
		scr_sound(sound_killenemy);
		steppy = true;
	}
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = false;
}
