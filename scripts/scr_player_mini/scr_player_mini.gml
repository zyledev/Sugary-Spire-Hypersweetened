function scr_player_mini()
{
	if (grounded && sprite_index != spr_minizelle_run && sprite_index != spr_minizelle_walk && sprite_index != spr_minizelle_fall)
		sprite_index = spr_minizelle_idle;
	grav = 0.5;
	image_speed = 0.35;
	move = -input.key_left.check + input.key_right.check;
	hsp = movespeed * xscale;
	if (dir != xscale)
		dir = xscale;
	if (move != 0 && sprite_index != spr_minizelle_run)
	{
		xscale = move;
		movespeed = 5;
	}
	else
		movespeed = 0;
	if (movespeed != 0 && grounded && sprite_index != spr_minizelle_run && sprite_index != spr_minizelle_land)
		sprite_index = spr_minizelle_walk;
	if (input.key_jump.pressed && grounded)
	{
		sprite_index = spr_minizelle_jump;
		vsp = -8;
	}
	if (sprite_index == spr_minizelle_jump && animation_end())
		sprite_index = spr_minizelle_fall;
	if (sprite_index == spr_minizelle_fall && grounded)
		sprite_index = spr_minizelle_land;
	if (sprite_index == spr_minizelle_land && animation_end())
		sprite_index = spr_minizelle_idle;
	if (movespeed == 0 && sprite_index == spr_minizelle_walk)
		sprite_index = spr_minizelle_idle;
}
