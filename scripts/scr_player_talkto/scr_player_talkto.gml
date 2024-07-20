function scr_player_talkto()
{
	image_speed = 0.35;
	if (key_jump2)
		state = states.normal;
	hsp = 0;
	vsp = 0;
	if (sprite_index != spr_idle)
		sprite_index = spr_idle;
}
