function scr_player_bushdisguise()
{
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 0;
	}
	move = key_left + key_right;
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
		vsp = -11;
	sprite_index = spr_player_bushidle;
	if (key_down)
	{
		sprite_index = spr_null;
		bushdetection = true;
	}
	if (!key_down)
		bushdetection = false;
}
