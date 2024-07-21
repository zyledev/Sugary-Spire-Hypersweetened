function scr_enemy_throw()
{
	if (floor(image_index) == (image_number - 1) && grounded)
	{
		state = baddiestates.idle;
		image_index = 0;
	}
	if (!grounded && hsp < 0)
		hsp += 0.1;
	else if (!grounded && hsp > 0)
		hsp -= 0.1;
	sprite_index = spr_throw;
	hsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		sprite_index = walkspr;
		image_index = 0;
		state = states.cotton;
	}
	if (!bombreset && floor(image_index) == throw_frame)
	{
		bombreset = 100;
		sprite_index = spr_throw;
		switch (object_index)
		{
			case obj_cottonwitch:
				bombreset = 400;
				if (!audio_is_playing(sound_enemythrow))
					scr_sound(sound_enemythrow);
				with (instance_create(x, y, obj_cottonwitchprojectile))
					image_xscale = other.image_xscale;
				break;
			case obj_crackerkicker:
				if (!bombreset && floor(image_index) == throw_frame)
				{
					if (!audio_is_playing(sound_enemythrow))
						scr_sound(sound_enemythrow);
					instance_create(x, y, obj_crackerkicker_kickhitbox);
					with (instance_create(x, y, obj_crackerkicker_kickhitbox))
					{
						baddieID = other.id;
						image_xscale = other.image_xscale;
					}
				}
				bombreset = 100;
				break;
		}
	}
}
