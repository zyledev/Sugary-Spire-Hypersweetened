function scr_confecti_appear()
{
	drawxscale = image_xscale;
	if (sprite_index != spr_appear)
		sprite_index = spr_appear;
	if (animation_end())
	{
		sprite_index = spr_idle;
		state = confectistates.normal;
	}
}
