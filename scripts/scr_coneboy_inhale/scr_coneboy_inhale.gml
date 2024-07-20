function scr_coneboy_inhale()
{
	movespeed = 0;
	vsp = 0;
	if (!inhaling)
		inhaling = true;
	sprite_index = spr_coneboy_inhale;
	if (!key_attack)
	{
		state = states.normal;
		inhaling = false;
	}
}
