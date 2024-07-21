function scr_player_talkto()
{
	image_speed = 0.35;
	if (input.key_jump.check)
		state = states.normal;
	hsp = 0;
	vsp = 0;
	if (sprite_index != spr_idle)
		sprite_index = spr_idle;
}
