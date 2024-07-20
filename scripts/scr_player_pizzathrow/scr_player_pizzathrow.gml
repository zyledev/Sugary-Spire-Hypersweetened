function scr_player_pizzathrow()
{
	movespeed = 0;
	mach2 = 0;
	hsp = 0;
	xscale = -1;
	jumpstop = false;
	if (!global.mallowfollow && !global.crackfollow && !global.chocofollow && !global.wormfollow && !global.candyfollow)
	{
		state = states.normal;
		landAnim = false;
		mach2 = 0;
		image_index = 0;
	}
	if ((global.mallowfollow || global.crackfollow || global.chocofollow || global.wormfollow || global.candyfollow) && !instance_exists(obj_toppinsacrifice))
	{
		instance_create(x, y - 75, obj_toppinsacrifice);
		sprite_index = spr_player_pizzathrow;
	}
	if (instance_exists(obj_toppinsacrifice))
	{
		if (!obj_toppinsacrifice.throwed && key_slap2)
		{
			obj_toppinsacrifice.hsp = -4;
			obj_toppinsacrifice.throwed = 1;
			obj_toppinsacrifice.vsp = -10;
		}
	}
	if (key_slap2)
	{
		scr_sound(sfx_cottongone);
		sprite_index = spr_player_pizzathrow2;
	}
	if (floor(image_index) == 3)
		sprite_index = spr_player_pizzathrow3;
	image_speed = 0.35;
}
