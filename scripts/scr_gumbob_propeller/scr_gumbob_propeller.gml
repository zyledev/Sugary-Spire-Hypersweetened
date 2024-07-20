function scr_gumbob_propeller()
{
	if (gumbobpropellerlength > 0)
		gumbobpropellerlength--;
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
		movespeed = 4;
	else
		movespeed = 0;
	movespeed = 4;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_gumbob_propeller_start)
		sprite_index = spr_gumbob_propeller_fly;
	if (sprite_index == spr_gumbob_propeller_start)
		vsp = 0;
	if (sprite_index == spr_gumbob_propeller_fly)
		vsp--;
	if (gumbobpropellerlength == 0)
	{
		gumbobpropellerlength = 100;
		state = states.normal;
		sprite_index = spr_fall;
		gumbobpropellercooldown = 100;
	}
	if (!key_jump2)
	{
		state = states.normal;
		gumbobpropellercooldown = 100;
	}
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x - sign(hsp), y, obj_slope))
	{
		state = states.Sjumpland;
		sprite_index = spr_player_superjumpland;
	}
}
