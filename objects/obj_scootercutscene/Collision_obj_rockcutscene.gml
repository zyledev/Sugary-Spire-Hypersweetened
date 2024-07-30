if (sprite_index != spr_player_outofcontrolfall)
{
	hit = true;
	vsp = -20;
	hsp = 8;
	scr_sound(sound_losetransformation);
	instance_create(x, y, obj_bangeffect);
	sprite_index = spr_player_outofcontrolfall;
	for (var i = 0; i < 5; i++;)
	{
		with (instance_create(x, y, obj_debris))
		{
			sprite_index = spr_introdebris;
			image_index = i;
			vsp = floor(random_range(-10, -14));
			hsp = floor(random_range(-5, 7));
		}
	}
}
