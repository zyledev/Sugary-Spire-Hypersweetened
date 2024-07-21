function scr_player_cottondrill()
{
	image_speed = 0.35;
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = -input.key_left.check + input.key_right.check;
	if (move != 0)
		xscale = move;
	hsp = 0;
	sprite_index = spr_cotton_drill;
	if (grounded)
	{
		state = states.cotton;
		sprite_index = spr_cotton_land;
		vsp = 0;
		movespeed = 0;
		image_index = 0;
	}
	if (input.key_attack.pressed && sprite_index != spr_cotton_attack && groundedcot)
	{
		state = states.cotton;
		flash = true;
		image_index = 0;
		sprite_index = spr_cotton_attack;
		grounded = false;
		vsp = -5;
		grav = 0.2;
		scr_sound(sound_suplex1);
		groundedcot = false;
	}
	if (input.key_jump.pressed)
	{
		state = states.cotton;
		vsp = -10;
		grav = 0.1;
		image_index = 0;
		sprite_index = spr_cotton_doublejump;
		instance_create(x, y, obj_highjumpcloud2);
		with (instance_create(x, y, obj_highjumpcloud2))
		{
			image_xscale = other.xscale;
			sprite_index = spr_cottonpoof;
		}
		scr_sound(sound_jump);
	}
}
