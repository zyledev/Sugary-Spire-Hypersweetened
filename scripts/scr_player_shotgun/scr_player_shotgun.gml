function scr_player_shotgun()
{
	hsp = xscale * movespeed;
	dir = xscale;
	if (grounded)
	{
		if (movespeed > 0)
			movespeed -= 0.2;
	}
	if (scr_solid(x + hsp, y))
		movespeed = 0;
	landAnim = false;
	momemtum = true;
	if (floor(image_index) == (image_number - 1))
	{
		shotgunAnim = true;
		if (grounded)
		{
			sprite_index = spr_shotgun_idle;
			state = states.normal;
		}
		else
		{
			sprite_index = spr_shotgun_fall;
			state = states.jump;
		}
	}
	image_speed = 0.4;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 4)
		instance_create(x, y, obj_slidecloud);
}
