function scr_player_runonball()
{
	move = -input.key_left.check + input.key_right.check;
	if (!input.key_mach.check)
		hsp = move * movespeed;
	else
		hsp = image_xscale * movespeed;
	jumpstop = false;
	vsp = obj_player.vsp;
	if (!place_meeting(x, y + 1, obj_runonball))
	{
		mach2 = 0;
		state = states.normal;
		jumpAnim = true;
		jumpstop = false;
	}
	if (input.key_jump.pressed && grounded && !input.key_down.check && !input.key_mach.check)
	{
		vsp = -7;
		state = states.jump;
		image_index = 0;
		machslideAnim = true;
		jumpAnim = true;
		audio_sound_gain(sfx_jump, 0.7, 0);
		if (!audio_is_playing(sfx_jump))
			audio_play_sound(sfx_jump, 1, false);
	}
	movespeed = 2.5;
	sprite_index = spr_player_slipnslide;
	if (input.key_mach.check && grounded)
	{
		if (mach2 < 35)
		{
			mach2++;
			movespeed = 4;
		}
		if (mach2 >= 35)
			movespeed = 6;
	}
	if (!input.key_mach.check)
		mach2 = 0;
	image_speed = 0.35;
}
