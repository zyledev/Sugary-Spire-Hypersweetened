function scr_player_charge()
{
	if (windingAnim < 2000)
		windingAnim++;
	if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
		hsp = xscale * movespeed;
	else if (place_meeting(x, y + 1, obj_railh))
		hsp = (xscale * movespeed) - 5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = (xscale * movespeed) + 5;
	if (!key_attack)
		movespeed -= 0.5;
	else
	{
		if (movespeed < 10)
			movespeed++;
		if (floor(movespeed > 10))
			movespeed = 10;
	}
	move2 = key_right2 + key_left2;
	move = key_right + key_left;
	crouchslideAnim = true;
	if (!key_jump2 && !jumpstop && vsp < 0.5)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (movespeed <= 0)
		state = states.grab;
	if (key_slap2)
	{
		sprite_index = spr_player_swingdingend;
		state = states.finishingblow;
		image_index = 0;
		hsp = 0;
		movespeed = 0;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (input_buffer_jump < 8 && grounded)
	{
		scr_sound(sound_jump);
		vsp = -10;
	}
	if (key_jump)
		input_buffer_jump = 0;
	if ((scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + 1, y, obj_slope)) || (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x - 1, y, obj_slope)))
		xscale *= -1;
	image_speed = 0.65;
	if (!instance_exists(obj_dashcloud) && grounded)
		instance_create(x, y, obj_dashcloud);
}
