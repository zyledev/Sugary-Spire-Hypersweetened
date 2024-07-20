function scr_enemy_throw()
{
	global.spr_throw[153] = spr_gumball_throw; // not even going to ask
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
	if (place_meeting(x, y + 1, obj_railh))
		hsp = -5;
	else if (place_meeting(x, y + 1, obj_railh2))
		hsp = 5;
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
			case obj_gumballmachine:
				bombreset = 500;
				if (!audio_is_playing(sound_enemythrow))
					scr_sound(sound_enemythrow);
				with (instance_create(x + (image_xscale * 6), y - 6, obj_gumball))
				{
					image_xscale = other.image_xscale;
					hsp = other.image_xscale * 5;
					vsp = -4;
				}
				break;
			case obj_cottonwitch:
				bombreset = 400;
				if (!audio_is_playing(sound_enemythrow))
					scr_sound(sound_enemythrow);
				with (instance_create(x, y, obj_cottonwitchprojectile))
					image_xscale = other.image_xscale;
				break;
			case obj_rudejanitor:
				bombreset = 500;
				if (!audio_is_playing(sound_enemythrow))
					scr_sound(sound_enemythrow);
				with (instance_create(x, y, obj_bomb))
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
