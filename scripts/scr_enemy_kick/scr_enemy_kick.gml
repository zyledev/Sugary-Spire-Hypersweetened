function scr_enemy_kick()
{
	movespeed = 0;
	hsp = 0;
	if (image_index >= 5)
	{
		with (instance_create(x, y, obj_crackerkicker_kickhitbox))
		{
			baddieID = other.id;
			image_xscale = other.image_xscale;
		}
		if (!audio_is_playing(sound_enemythrow))
			scr_sound(sound_enemythrow);
	}
	if (floor(image_index) == (image_number - 1))
	{
		state = baddiestates.walk;
		sprite_index = spr_crackerkicker_walk;
		movespeed = 1;
	}
}
