function scr_player_parry()
{
	hsp = movespeed * xscale;
	if (!instance_exists(obj_mach3effect))
		instance_create(x, y, obj_mach3effect);
	if (movespeed < 0 && grounded)
		movespeed += 0.2;
	if (movespeed > 0)
		movespeed = 0;
	if (animation_end())
	{
		state = tauntstoredstate;
		movespeed = tauntstoredmovespeed;
		sprite_index = tauntstoredsprite;
	}
	image_speed = 0.35;
}
