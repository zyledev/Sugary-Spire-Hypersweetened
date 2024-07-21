function scr_player_tumble()
{
	mask_index = spr_crouchmask;
	hsp = xscale * movespeed;
	if (sprite_index == spr_tumblestart)
		movespeed = 6;
	else
		movespeed = 14;
	if (!scr_slope() && sprite_index == spr_tumblestart && floor(image_index) < 11)
		image_index = 11;
	if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
		sprite_index = spr_tumble;
	if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		scr_sound(sound_tumbleend);
		hsp = 0;
		movespeed = 0;
		sprite_index = spr_tumbleend;
		state = states.bump;
		image_index = 0;
	}
	if (input.key_jump.pressed)
		input_buffer_jump = 0;
	if (!input.key_jump.check && !jumpstop && vsp < 0.5 && !stompAnim)
	{
		vsp /= 2;
		jumpstop = true;
	}
	if (grounded && vsp > 0)
		jumpstop = false;
	if (input_buffer_jump < 8 && grounded && hsp != 0)
		vsp = -9;
	image_speed = 0.35;
	if (!audio_is_playing(sound_tumble))
		scr_sound(sound_tumble);
	if (place_meeting(x, y, obj_slope) && xscale == 1)
		x -= 2;
	if (place_meeting(x, y, obj_slope) && xscale == -1)
		x += 2;
}
