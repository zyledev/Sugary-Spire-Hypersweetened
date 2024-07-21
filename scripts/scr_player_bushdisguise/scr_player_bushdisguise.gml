function scr_player_bushdisguise()
{
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = -input.key_left.check + input.key_right.check;
	if (move != 0)
		xscale = move;
	hsp = move * movespeed;
	if (move != 0)
		movespeed = 5;
	else
		movespeed = 0;
	movespeed = 4;
	if (scr_solid(x + sign(hsp), y) && (xscale == 1 && (move == 1 && !place_meeting(x + 1, y, obj_slope))))
		movespeed = 0;
	if (scr_solid(x + sign(hsp), y) && (xscale == -1 && (move == -1 && !place_meeting(x - 1, y, obj_slope))))
		movespeed = 0;
	if (input.key_jump.check && grounded)
		vsp = -11;
	sprite_index = spr_player_bushidle;
	if (input.key_down.check)
	{
		sprite_index = spr_null;
		bushdetection = true;
	}
	if (!input.key_down.check)
		bushdetection = false;
}
