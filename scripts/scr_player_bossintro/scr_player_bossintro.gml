function scr_player_bossintro()
{
	hsp = 0;
	xscale = 1;
	hurted = false;
	inv_frames = 0;
	if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
	{
		state = states.normal;
		image_index = 0;
	}
	image_speed = 0.35;
}
