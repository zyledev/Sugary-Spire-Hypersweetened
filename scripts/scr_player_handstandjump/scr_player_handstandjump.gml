function scr_player_handstandjump()
{
	switch (character)
	{
		case "P":
			move = -input.key_left.check + input.key_right.check;
			landAnim = false;
			mach2 = 35;
			hsp = xscale * movespeed;
			grav = 0;
			momemtum = true;
			dir = xscale;
			if (image_index < 2)
				movespeed = 12;
			if (image_index > 7)
				movespeed -= 1;
			if (move != xscale && move != 0)
			{
				state = states.jump;
				image_index = 0;
				sprite_index = spr_player_suplexdashCancel;
				jumpAnim = true;
				momemtum = false;
				mach2 = 0;
				xscale *= -1;
				if (audio_is_playing(sound_suplex1))
					audio_stop_sound(sound_suplex1);
			}
			if (floor(image_index) == (image_number - 1))
			{
				state = states.normal;
				grav = 0.5;
				flash = false;
			}
			if (input.key_down.check)
			{
				if (grounded)
				{
					grav = 0.5;
					sprite_index = spr_crouchslip;
					machhitAnim = false;
					state = states.crouchslide;
					if (audio_is_playing(sound_suplex1))
						audio_stop_sound(sound_suplex1);
				}
				else
				{
					grav = 0.5;
					image_index = 1;
					state = states.freefallprep;
					sprite_index = spr_player_bodyslamstart;
					vsp = -5;
				}
			}
			if (input.key_jump.pressed && grounded)
			{
				movespeed = 10;
				sprite_index = spr_mach2jump;
				instance_create(x, y, obj_jumpdust);
				state = states.mach2;
				vsp = -9;
				if (audio_is_playing(sound_suplex1))
					audio_stop_sound(sound_suplex1);
			}
			if ((scr_solid(x + xscale, y) && !scr_slope_ext(x + xscale, y)) && !place_meeting(x + xscale, y, obj_destructibles))
			{
				grav = 0.5;
				movespeed = 0;
				state = states.bump;
				hsp = -2.5 * xscale;
				vsp = -3;
				mach2 = 0;
				image_index = 0;
				machslideAnim = true;
				machhitAnim = false;
				instance_create(x + (10 * xscale), y + 10, obj_bumpeffect);
				if (audio_is_playing(sound_suplex1))
					audio_stop_sound(sound_suplex1);
				scr_sound(sound_bump);
			}
			image_speed = 0.3;
			break;
	}
	if (input.key_mach.check && floor(image_index) == (image_number - 1) && sprite_index != spr_player_bump)
	{
		movespeed = 10;
		mach2 = 20;
		state = states.mach2;
		sprite_index = spr_mach;
	}
	if (!global.starrmode)
	{
		if (input.key_attack.pressed && !input.key_down.check)
		{
			sprite_index = spr_player_machtumble;
			image_index = 0;
			image_speed = 0.2;
			state = states.machtumble;
			with (instance_create(x, y, obj_jumpdust))
				image_xscale = other.xscale;
		}
	}
}
