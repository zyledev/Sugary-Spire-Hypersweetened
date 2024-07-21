function scr_enemy_stun()
{
	stunned--;
	sprite_index = stunfallspr;
	image_speed = 0.35;
	if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0)
	{
		hsp = 0;
		if (thrown && hp <= 0)
			instance_destroy();
		if (hp > 0)
			thrown = false;
	}
	if ((grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))) && vsp > 0)
	{
		hsp = 0;
		if (thrown && hp <= 0)
			instance_destroy();
		if (hp > 0)
			thrown = false;
	}
	if (((scr_solid(x + 1, y) && image_xscale == -1) || (scr_solid(x - 1, y) && image_xscale == 1)) && !thrown)
	{
		grav = 0.5;
		image_xscale *= -1;
		hsp = -image_xscale * 4;
	}
	if (((scr_solid(x + 1, y) && image_xscale == -1) || (scr_solid(x - 1, y) && image_xscale == 1)) && thrown)
	{
		instance_destroy();
	}
	if ((grounded && stunned < 0) && object_index != obj_babybear)
	{
		image_index = 0;
		if (object_index != obj_charger && object_index != obj_swedishfish)
		{
			movespeed = 1;
			state = baddiestates.walk;
			sprite_index = walkspr;
		}
		else
		{
			sprite_index = idlespr;
			state = baddiestates.idle;
		}
	}
	if ((grounded && stunned < 0) && object_index == obj_babybear)
	{
		image_index = 0;
		movespeed = 5;
		state = baddiestates.walk;
		sprite_index = walkspr;
		vsp -= 8;
	}
}
