function scr_player_fling()
{
	image_speed = 0.35;
	if (sprite_index == spr_player_candybegin && animation_end())
		sprite_index = spr_player_candyidle;
}
