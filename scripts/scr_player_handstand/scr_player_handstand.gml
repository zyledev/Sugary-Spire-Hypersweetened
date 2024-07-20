function scr_player_handstand()
{
	image_speed = 0.35;
	scr_getinput();
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = key_left + key_right;
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
		if (key_jump2 && !key_down)
			vsp = -11;
		if (key_down && !key_jump2)
			vsp = -4;
		if (!key_jump2 && !key_down)
			vsp = -7;
		if (!bounced)
			bounced = true;
	}
	if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
		sprite_index = spr_null;
	if (!key_attack)
		state = states.normal;
	if (key_slap2 && bounced != false && !key_up)
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
	else if (key_slap2 && bounced != 0 && key_up)
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
