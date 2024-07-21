function scr_player_shocked()
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
	if (key_jump2 && grounded)
		vsp = -8;
	sprite_index = spr_bump;
}
