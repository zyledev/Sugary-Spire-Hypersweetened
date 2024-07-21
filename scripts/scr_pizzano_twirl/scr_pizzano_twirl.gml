function scr_pizzano_twirl()
{
	sprite_index = spr_pizzano_twirl;
	move = -input.key_left.check + input.key_right.check;
	hsp = xscale * movespeed;
	if (move == xscale && movespeed < 12)
		movespeed += 0.5;
	else if (move != xscale && movespeed > 0)
		movespeed -= 0.25;
	if (grounded && !input.key_mach.check)
	{
		state = states.normal;
		image_index = 0;
		mach2 = 0;
		jumpstop = false;
	}
	else if (grounded && input.key_mach.check)
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
	if (input.key_attack.pressed && character == "N" && charged && !input.key_up.check)
	{
		flash = true;
		state = states.rocketfistpizzano;
		sprite_index = spr_pizzano_sjumpprepside;
		image_index = 0;
		movespeed = 0;
		mach2 = 0;
		charged = false;
	}
	if (input.key_attack.pressed && input.key_up.check && character == "N" && charged)
	{
		flash = true;
		alarm[0] = 240;
		image_index = 0;
		state = states.Sjump;
		sprite_index = spr_pizzano_sjumpprep;
	}
	if (input.key_jump.pressed && character == "N" && !grounded && scr_solid(x + xscale, y, true))
	{
		hsp = 0;
		vsp = 0;
		state = states.pizzanowallcling;
		sprite_index = spr_pizzano_wallcling;
	}
}
