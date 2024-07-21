function scr_pizzano_shoulderbash()
{
	hsp = xscale * movespeed;
	if (input.key_jump.pressed && grounded)
	{
		state = states.pizzanotwirl;
		vsp = -12;
	}
	if ((scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope)) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		movespeed = -3.5;
		vsp = -8;
		mach2 = 0;
		state = states.bump;
		image_index = 0;
		machslideAnim = true;
		machhitAnim = false;
		instance_create(x + 10, y + 10, obj_bumpeffect);
		if (audio_is_playing(sound_suplex1))
			audio_stop_sound(sound_suplex1);
		scr_sound(sound_bump);
	}
	if ((scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope)) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		movespeed = -3.5;
		vsp = -8;
		mach2 = 0;
		state = states.bump;
		image_index = 0;
		machslideAnim = true;
		machhitAnim = false;
		instance_create(x + 10, y + 10, obj_bumpeffect);
		if (audio_is_playing(sound_suplex1))
			audio_stop_sound(sound_suplex1);
		scr_sound(sound_bump);
	}
	if (input.key_mach.check && grounded)
	{
		flash = true;
		state = states.mach2;
		image_index = 0;
		sprite_index = spr_mach;
		jumpstop = false;
	}
}
