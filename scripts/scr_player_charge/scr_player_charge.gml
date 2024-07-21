function scr_player_charge()
{
	if (windingAnim < 2000)
		windingAnim++;
	hsp = xscale * movespeed;
	if (!input.key_mach.check)
		movespeed -= 0.5;
	else
	{
		if (movespeed < 10)
			movespeed++;
		if (floor(movespeed > 10))
			movespeed = 10;
	}
	move2 = input.key_right.pressed + -input.key_left.pressed;
	move = input.key_right.check + -input.key_left.check;
	crouchslideAnim = true;
	if (!input.key_jump.check && !jumpstop && vsp < 0.5)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (movespeed <= 0)
		state = states.grab;
	if (input.key_attack.pressed)
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
	if (input.key_jump.pressed)
		input_buffer_jump = 0;
	if ((scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + 1, y, obj_slope)) || (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x - 1, y, obj_slope)))
		xscale *= -1;
	image_speed = 0.65;
	if (!instance_exists(obj_dashcloud) && grounded)
		instance_create(x, y, obj_dashcloud);
}
