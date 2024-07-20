function scr_enemy_slugjump()
{
	hsp = movespeed * sign(image_xscale);
	if (sprite_index == spr_sluggy_jumpstart || sprite_index == spr_sluggy_land)
	{
		hsp = 0;
		movespeed = 0;
	}
	else
		movespeed = approach(movespeed, 2, 1);
	if (animation_end() && sprite_index == spr_sluggy_jumpstart)
	{
		sprite_index = spr_sluggy_jump;
		vsp = -11;
		grounded = false;
	}
	if (scr_solid(x + sign(hsp), y) && !scr_slope_ext(x + sign(hsp), y))
	{
		movespeed = 0;
		image_xscale *= -1;
	}
	if (sprite_index == spr_sluggy_jump && grounded)
		sprite_index = spr_sluggy_land;
	if (sprite_index == spr_sluggy_land && animation_end())
	{
		state = baddiestates.walk;
		sprite_index = walkspr;
		movespeed = 1;
	}
}
