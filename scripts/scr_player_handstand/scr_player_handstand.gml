function scr_player_handstand()
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
	hsp = (move * movespeed) + bouncespeed;
	if (move != 0)
		bouncespeed += (0.05 * move);
	if (move == 0)
		bouncespeed = 0;
	if (sprite_index == spr_null && scr_solid(x, y + 1))
	{
		sprite_index = spr_null;
		movespeed = 0;
		vsp = 0;
		image_index = 0;
	}
	if (sprite_index == spr_null && floor(image_index) < 4 && grounded)
	{
		vsp = 0;
		movespeed = 0;
		hsp = 0;
	}
	if (sprite_index == spr_null && floor(image_index) == (image_number - 5))
	{
		movespeed = 10 + bouncespeed;
		if (input.key_jump.check && !input.key_down.check)
			vsp = -11;
		if (input.key_down.check && !input.key_jump.check)
			vsp = -4;
		if (!input.key_jump.check && !input.key_down.check)
			vsp = -7;
		if (!bounced)
			bounced = true;
	}
	if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
		sprite_index = spr_null;
	if (!input.key_mach.check)
		state = states.normal;
	if (input.key_attack.pressed && bounced != false && !input.key_up.check)
	{
		sprite_index = spr_null;
		image_index = 0;
		hsp = 0;
		vsp = 0;
		movespeed = 0;
		bouncespeed = 0;
		bounced = false;
		state = states.mach3;
	}
	else if (input.key_attack.pressed && bounced != 0 && input.key_up.check)
	{
		sprite_index = spr_null;
		image_index = 0;
		hsp = 0;
		vsp = 0;
		movespeed = 0;
		bouncespeed = 0;
		bounced = false;
		state = states.Sjump;
	}
}
