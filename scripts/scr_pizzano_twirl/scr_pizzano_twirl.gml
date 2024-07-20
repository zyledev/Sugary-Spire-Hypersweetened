function scr_pizzano_twirl()
{
	sprite_index = spr_pizzano_twirl;
	move = key_left + key_right;
	hsp = xscale * movespeed;
	if (move == xscale && movespeed < 12)
		movespeed += 0.5;
	else if (move != xscale && movespeed > 0)
		movespeed -= 0.25;
	if (grounded && !key_attack)
	{
		state = states.normal;
		image_index = 0;
		mach2 = 0;
		jumpstop = false;
	}
	else if (grounded && key_attack)
	{
		state = states.mach2;
		image_index = 0;
		sprite_index = spr_mach;
		jumpstop = false;
	}
	var jumpbad = instance_place(x, y + vsp, obj_baddie);
	if (jumpbad)
	{
		instance_destroy(jumpbad);
		vsp = -10;
	}
	if (key_slap2 && character == "N" && charged && !key_up)
	{
		flash = true;
		state = states.rocketfistpizzano;
		sprite_index = spr_pizzano_sjumpprepside;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		charged = false;
	}
	if (key_slap2 && key_up && character == "N" && charged)
	{
		flash = true;
		alarm[0] = 240;
		image_index = 0;
		state = states.Sjump;
		sprite_index = spr_pizzano_sjumpprep;
	}
	if (key_jump && character == "N" && !grounded && scr_solid(x + xscale, y, true))
	{
		hsp = 0;
		vsp = 0;
		state = states.pizzanowallcling;
		sprite_index = spr_pizzano_wallcling;
	}
}
