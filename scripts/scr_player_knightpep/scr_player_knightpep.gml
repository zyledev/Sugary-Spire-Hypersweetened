function scr_player_knightpep()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hurted = true;
	if (sprite_index == spr_knightpep_walk || sprite_index == spr_knightpep_jump || sprite_index == spr_knightpep_fall || sprite_index == spr_knightpep_idle)
	{
		move = key_left + key_right;
		hsp = move * movespeed;
	}
	else if (grounded)
	{
		hsp = 0;
		move = 0;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if (!key_jump2 && !jumpstop && vsp < 0.5 && !stompAnim)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if ((sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk) && key_slap2)
	{
		scr_sound(20);
		instance_create(x, y, obj_swordhitbox);
		instance_create(x + (-xscale * 10), y, obj_slidecloud);
		sprite_index = spr_knightpep_attack;
		image_index = 0;
		state = states.knightpepattack;
	}
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	if (grounded && move != 0 && sprite_index == spr_knightpep_idle)
		sprite_index = spr_knightpep_walk;
	else if (grounded && move == 0 && sprite_index == spr_knightpep_walk)
		sprite_index = spr_knightpep_idle;
	if (input_buffer_jump < 8 && vsp > 0 && grounded && (sprite_index == spr_knightpep_idle || sprite_index == spr_knightpep_walk))
	{
		scr_sound(sound_maximumspeedstop);
		image_index = 0;
		sprite_index = spr_knightpep_jumpstart;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jumpstart)
	{
		vsp = -11;
		if (key_right)
			hsp = 4;
		if (-key_left)
			hsp = -4;
		sprite_index = spr_knightpep_jump;
	}
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_jump) || (!grounded && sprite_index != spr_knightpep_jump))
		sprite_index = spr_knightpep_fall;
	if (sprite_index == spr_knightpep_fall && grounded)
	{
		with (obj_baddie)
		{
			if (point_in_camera(x, y, view_camera[0]) && grounded)
			{
				vsp = -7;
				hsp = 0;
			}
		}
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		combo = 0;
		bounce = 0;
		image_index = 0;
		freefallstart = 0;
		momemtum = false;
		scr_sound(19);
		instance_create(x, y, obj_landcloud);
		sprite_index = spr_knightpep_land;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_land)
		sprite_index = spr_knightpep_idle;
	if (move != 0)
		xscale = move;
	if (move != 0)
	{
		if (movespeed < 6)
			movespeed += 0.5;
		else if (movespeed == 6)
			movespeed = 6;
	}
	else
		movespeed = 0;
	if (move != 0)
	{
		if (movespeed < 1)
			image_speed = 0.15;
		else if (movespeed > 1 && movespeed < 4)
			image_speed = 0.35;
		else
			image_speed = 0.6;
	}
	else
		image_speed = 0.35;
	if (floor(image_index) == 4 && sprite_index == spr_knightpep_start)
		instance_create(x, y - 600, obj_thunder);
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_thunder)
		sprite_index = spr_knightpep_idle;
	if (!instance_exists(obj_cloudeffect) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
		instance_create(x, y + 43, obj_cloudeffect);
	if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && !steppy)
	{
		scr_sound(7);
		steppy = true;
	}
	if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = false;
}
