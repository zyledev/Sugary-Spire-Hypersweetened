if (audio_is_playing(mu_pause)) audio_stop_sound(mu_pause);
bgx++;
bgy++;
if (selected == 0)
{
	input_check(input);
	if ((input.key_up.pressed || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected -= 1;
		scr_sound(sound_step);
	}
	if ((input.key_down.pressed || keyboard_check_pressed(vk_down)) && optionselected < 3)
	{
		optionselected += 1;
		scr_sound(sound_step);
	}
	switch (optionselected)
	{
		case option_selected.back:
			subtitle = "GO BACK TO MAIN SCREEN";
			CursorY = -999;
			if (input.key_confirm.pressed)
			{
				scr_sound(sound_enemythrow);
				instance_destroy();
			}
			break;
		case option_selected.audio:
			subtitle = "ADJUST AUDIO SETTINGS";
			CursorY = 100;
			if (input.key_confirm.pressed)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Audio);
			}
			break;
		case option_selected.video:
			subtitle = "ADJUST VIDEO SETTINGS";
			CursorY = 200;
			if (input.key_confirm.pressed)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Video);
			}
			break;
		case option_selected.input:
			subtitle = "CHANGE CONTROL INPUTS";
			CursorY = 300;
			if (input.key_confirm.pressed)
			{
				scr_sound(sound_enemythrow);
				selected = true;
				instance_create(0, 0, obj_Options_Input);
			}
			break;
		case option_selected.misc:
			subtitle = string_upper("Adjust Miscellaneous Settings");
			CursorY = 400;
			if (input.key_confirm.pressed)
				scr_sound(sound_enemythrow);
			break;
	}
	if (input.key_back.pressed || input.key_start.check)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
}
