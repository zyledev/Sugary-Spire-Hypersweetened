function scr_gumbob_mixnbrew()
{
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_gumbob_brew_pulloutdrink)
		sprite_index = spr_gumbob_brew_shake;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_gumbob_brew_shake)
		state = states.normal;
	if (sprite_index == spr_gumbob_brew_shake && input.key_up.check)
	{
		sprite_index = spr_gumbob_brew_up;
		image_index = 0;
	}
	if (sprite_index == spr_gumbob_brew_up && floor(image_index) == (image_number - 8))
	{
		if (!instance_exists(obj_gumbobprojectile))
		{
			with (instance_create_depth(x + 5, y - 100, -2, obj_gumbobprojectile))
				hsp = 2;
			with (instance_create_depth(x - 5, y - 100, -2, obj_gumbobprojectile))
				hsp = -2;
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_gumbob_brew_up)
	{
		state = states.normal;
		sprite_index = spr_gumbob_idle;
	}
}
