if (canmove)
{
	scr_getinput();
	if ((key_up2 || keyboard_check_pressed(vk_up)) && optionselected > 0)
	{
		optionselected -= 1;
		scr_sound(sound_step);
		optionsaved_fullscreen = global.fullscreen;
		optionsaved_resolution = global.selectedResolution;
		optionsaved_smoothcam = global.smoothcam;
		optionsaved_screentilt = global.screentilt;
		optionsaved_hitstun = global.hitstunEnabled;
	}
	if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 4)
	{
		optionselected += 1;
		scr_sound(sound_step);
		optionsaved_fullscreen = global.fullscreen;
		optionsaved_resolution = global.selectedResolution;
		optionsaved_smoothcam = global.smoothcam;
		optionsaved_screentilt = global.screentilt;
		optionsaved_hitstun = global.hitstunEnabled;
	}
	switch (optionselected)
	{
		case video_selected.back:
			subtitle = "GO BACK TO MAIN SCREEN";
			CursorY = -999;
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				instance_destroy();
			}
			break;
		case video_selected.fullscreen:
			subtitle = "TOGGLE WINDOW MODE";
			CursorY = 100;
			optionsaved_fullscreen += (key_right2 + key_left2);
			optionsaved_fullscreen = wrap(optionsaved_fullscreen, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				window_set_fullscreen(optionsaved_fullscreen);
				ini_open("optionData.ini");
				ini_write_real("Settings", "fullscrn", optionsaved_fullscreen);
				ini_close();
				global.fullscreen = optionsaved_fullscreen;
			}
			break;
		case video_selected.resolution:
			subtitle = "ADJUST WINDOWED RESOLUTION";
			CursorY = 200;
			optionsaved_resolution += (key_right2 + key_left2);
			optionsaved_resolution = wrap(optionsaved_resolution, 0, 2);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				switch (optionsaved_resolution)
				{
					case 0:
						window_set_size(480, 260);
						break;
					case 1:
						window_set_size(960, 540);
						break;
					case 2:
						window_set_size(1280, 720);
						break;
				}
				ini_open("optionData.ini");
				ini_write_real("Settings", "resolution", optionsaved_resolution);
				ini_close();
				global.selectedResolution = optionsaved_resolution;
			}
			break;
		case video_selected.smoothcam:
			subtitle = "TOGGLE SMOOTHCAM";
			CursorY = 300;
			optionsaved_smoothcam += (key_right2 + key_left2);
			optionsaved_smoothcam = wrap(optionsaved_smoothcam, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "smthcam", optionsaved_smoothcam);
				ini_close();
				global.smoothcam = optionsaved_smoothcam;
			}
			break;
		case video_selected.screentilt:
			subtitle = "TOGGLE ESCAPE SCREEN TILT EFFECTS";
			CursorY = 400;
			optionsaved_screentilt += (key_right2 + key_left2);
			optionsaved_screentilt = wrap(optionsaved_screentilt, 0, 1);
			if (key_jump)
			{
				scr_sound(sound_enemythrow);
				ini_open("optionData.ini");
				ini_write_real("Settings", "scrntilt", optionsaved_screentilt);
				ini_close();
				global.screentilt = optionsaved_screentilt;
			}
			break;
	}
	if (key_slap2 || key_start)
	{
		scr_sound(sound_enemythrow);
		instance_destroy();
	}
	obj_Options_Main.CursorY = CursorY;
}
