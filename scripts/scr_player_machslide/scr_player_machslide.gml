function scr_player_machslide()
{
	hsp = xscale * movespeed;
	move = input.key_right.check + -input.key_left.check;
	if (movespeed >= 0 && sprite_index != spr_player_hurtroll)
		movespeed -= 0.4;
	if (sprite_index == spr_player_hurtroll && grounded)
		sprite_index = spr_player_crouchslide;
	if (sprite_index == spr_player_crouchslide && movespeed <= 0)
		state = states.normal;
	if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
		sprite_index = spr_machslide;
	image_speed = 0.35;
	landAnim = false;
	if (floor(movespeed) == 0 && (sprite_index == spr_machslide || sprite_index == spr_player_crouchslide))
	{
		image_index = 0;
		if (sprite_index == spr_machslide)
			machslideAnim = true;
		movespeed = 0;
		state = states.normal;
		movespeed = 4;
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost && mach2 != 0)
	{
		movespeed = 10;
		momemtum = true;
		state = states.mach2;
		image_index = 0;
		xscale *= -1;
		instance_create(x, y, obj_jumpdust);
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_machslideboost3 && mach2 != 0)
	{
		movespeed = 12;
		sprite_index = spr_player_mach4;
		scr_sound(sound_dash2);
		momemtum = true;
		state = states.mach3;
		image_index = 0;
		xscale *= -1;
		instance_create(x, y, obj_jumpdust);
	}
	if (mach2 >= 35)
	{
		if (!instance_exists(obj_dashcloud) && grounded)
			instance_create(x, y, obj_dashcloud);
	}
	else if (mach2 >= 100)
	{
		if (!instance_exists(obj_dashcloud2) && grounded)
			instance_create(x, y, obj_dashcloud2);
	}
}
