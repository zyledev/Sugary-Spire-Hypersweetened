function scr_player_barrelnormal()
{
	mask_index = spr_player_mask;
	move = -input.key_left.check + input.key_right.check;
	hsp = move * movespeed;
	if (vsp < 12)
		vsp += grav;
	if (!grounded && !input.key_jump.pressed)
	{
		state = states.barrelfall;
		image_index = 0;
		hsp = 0;
	}
	if ((input.key_down.check && grounded) || scr_solid(x, y - 3))
	{
		state = states.barrelcrouch;
		image_index = 0;
	}
	if (input.key_mach.check && grounded)
	{
		movespeed = 0;
		state = states.barrelmach1;
		landAnim = false;
	}
	if (place_meeting(x, y, obj_water2))
		vsp -= 1;
	movespeed = 2.5;
	if (move == 0)
		sprite_index = spr_player_barrelidle;
	if (move != 0)
	{
		sprite_index = spr_player_barrelmove;
		xscale = move;
	}
	image_speed = 0.35;
}
