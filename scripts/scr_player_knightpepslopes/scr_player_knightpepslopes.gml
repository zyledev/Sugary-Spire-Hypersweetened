function scr_player_knightpepslopes()
{
	alarm[5] = 2;
	alarm[7] = 60;
	hurted = true;
	hsp = xscale * movespeed;
	if (sprite_index == spr_knightpep_downslope)
		movespeed += 0.5;
	if (!scr_slope())
		sprite_index = spr_knightpep_charge;
	if (!scr_solid(x + sign(hsp), y) && !scr_solid(x + sign(hsp), y + 1) && scr_solid(x + sign(hsp), y + 2))
		sprite_index = spr_knightpep_downslope;
	if (sprite_index == spr_knightpep_charge)
		movespeed -= 0.1;
	if (scr_solid(x + sign(hsp), y))
	{
		instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
		vsp = -5;
		hsp = -xscale * 5;
		sprite_index = spr_knightpep_fall;
		state = states.knightpep;
	}
	if (movespeed <= 0 && sprite_index == spr_knightpep_charge)
	{
		sprite_index = spr_knightpep_idle;
		state = states.knightpep;
	}
	image_speed = 0.4;
}
