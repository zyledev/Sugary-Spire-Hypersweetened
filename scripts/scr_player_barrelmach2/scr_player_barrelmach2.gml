function scr_player_barrelmach2()
{
	hsp = image_xscale * movespeed;
	movespeed = 10;
	if (vsp < 12)
		vsp += grav;
	if (!grounded)
	{
		state = states.barrelfall;
		image_index = 0;
	}
	if (!input.key_mach.check && grounded)
	{
		state = states.barrelnormal;
		image_index = 0;
		mach2 = 0;
	}
	if (scr_solid(x + 1, y) && image_xscale == 1)
	{
		barrel = false;
		state = states.bump;
		hsp = -2;
		vsp = -2;
		mach2 = 0;
		image_index = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
	}
	if (scr_solid(x - 1, y) && image_xscale == -1)
	{
		barrel = false;
		state = states.bump;
		hsp = 2;
		vsp = -2;
		mach2 = 0;
		image_index = 0;
		instance_create(x - 10, y + 10, obj_bumpeffect);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
		instance_create(x + random_range(15, -15), y + random_range(15, -15), obj_wooddebris);
	}
	sprite_index = spr_player_barrelmach;
	image_speed = 0.35;
	instance_create(x, y, obj_mach2effect);
	if (!instance_exists(obj_dashcloud) && grounded)
		instance_create(x, y, obj_dashcloud);
}
