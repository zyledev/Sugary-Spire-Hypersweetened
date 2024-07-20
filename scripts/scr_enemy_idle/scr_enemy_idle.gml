function scr_enemy_idle()
{
	if (vsp > 1 && (grounded || (grounded && !place_meeting(x, y, obj_platform))))
	{
		instance_create(x, y, obj_landcloud);
		image_index = 0;
	}
	if (floor(image_index) == (image_number - 1) && roaming && (grounded || (grounded && !place_meeting(x, y, obj_platform))))
	{
		state = baddiestates.walk;
		image_index = 0;
	}
	if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0)
		hsp = 0;
	if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp < 0)
		hsp += 0.1;
	else if (!(grounded || (grounded && !place_meeting(x, y, obj_platform))) && hsp > 0)
		hsp -= 0.1;
	if (vsp > 1 && (grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))))
	{
		instance_create(x, y, obj_landcloud);
		image_index = 0;
	}
	if (floor(image_index) == (image_number - 1) && roaming && (grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))))
	{
		state = baddiestates.walk;
		image_index = 0;
	}
	if ((grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))) && vsp > 0)
		hsp = 0;
	if (!(grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))) && hsp < 0)
		hsp += 0.1;
	else if (!(grounded || (grounded && !place_meeting(x, y, obj_cottonplatform))) && hsp > 0)
		hsp -= 0.1;
	sprite_index = idlespr;
	image_speed = 0.35;
}
