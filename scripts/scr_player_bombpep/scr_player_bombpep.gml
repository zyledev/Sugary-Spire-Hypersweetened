function scr_player_bombpep()
{
	if (sprite_index == spr_bombpep_end)
		mask_index = spr_crouchmask;
	else
		mask_index = spr_player_mask;
	if (place_meeting(x, y, obj_watertop))
		bombpeptimer = 0;
	if (input.key_jump.pressed)
		input_buffer_jump = 0;
	if (!input.key_jump.check && !jumpstop && vsp < 0.5 && !stompAnim)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	mach2 = 0;
	landAnim = false;
	alarm[5] = 2;
	hsp = 0;
	movespeed = 0;
	if (sprite_index == spr_bombpep_end && floor(image_index) == (image_number - 1))
	{
		alarm[5] = 2;
		alarm[7] = 60;
		hurted = true;
		state = states.normal;
		sprite_index = spr_player_idle;
		image_index = 0;
	}
	if (bombpeptimer > 0)
		bombpeptimer -= 0.5;
	if (scr_solid(x + 1, y) && xscale == 1 && hsp != 0 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_chocofrogbig))
	{
		instance_create(x + 10, y + 10, obj_bumpeffect);
		xscale *= -1;
	}
	if (scr_solid(x - 1, y) && xscale == -1 && hsp != 0 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_chocofrogbig))
	{
		instance_create(x - 10, y + 10, obj_bumpeffect);
		xscale *= -1;
	}
	if (input_buffer_jump < 8 && grounded && hsp != 0)
		vsp = -9;
	if (movespeed < 4)
		image_speed = 0.35;
	else if (movespeed > 4 && movespeed < 8)
		image_speed = 0.45;
	else
		image_speed = 0.6;
	if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && !steppy && grounded)
		steppy = true;
	if (floor(image_index) != 0 && floor(image_index) != 2)
		steppy = false;
	if (!instance_exists(obj_dashcloud) && grounded && hsp != 0)
		instance_create(x, y, obj_dashcloud);
}
