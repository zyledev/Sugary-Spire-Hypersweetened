scr_getinput();
bgx++;
bgy++;
switch (menu)
{
	case "HOME":
		title = "OPTIONS";
		subtitle = "PRESS GRAB TO CLOSE THIS MENU";
		break;
	case "VIDEO":
		title = "VIDEO SETTINGS";
		break;
}
switch (menu)
{
	case "HOME":
		if (key_jump)
		{
			switch (select)
			{
				case 0:
					menu = "VIDEO";
					select = 0;
					break;
				case 1:
				case 2:
					menu = "KEY";
					select = 0;
					break;
			}
		}
		switch (select)
		{
			case 0:
				arrowy = 97;
				break;
			case 1:
				arrowy = 192;
				break;
			case 2:
				arrowy = 288;
				break;
		}
		if (key_down2 && select < 2)
		{
			select++;
			scr_sound(sound_step);
		}
		else if (key_down2 && select == 2)
		{
			select = 0;
			scr_sound(sound_step);
		}
		if (key_up2 && select > 0)
		{
			select--;
			scr_sound(sound_step);
		}
		else if (key_up2 && select == 0)
		{
			select = 2;
			scr_sound(sound_step);
		}
		break;
	case "VIDEO":
		if (key_jump)
		{
			switch (select)
			{
				case 0:
					if (!global.fullscreen)
						global.fullscreen = true;
					else
						global.fullscreen = false;
					break;
				case 1:
					if (!global.smoothcam)
						global.smoothcam = true;
					else
						global.smoothcam = false;
					break;
				case 2:
					if (!global.screentilt)
						global.screentilt = true;
					else
						global.screentilt = false;
					break;
				case 3:
					if (!global.playerrotate)
						global.playerrotate = true;
					else
						global.playerrotate = false;
					break;
				case 4:
					menu = "HOME";
					select = 0;
					ini_open("optionData.ini");
					ini_write_real("Settings", "fullscrn", global.fullscreen);
					ini_write_real("Settings", "smthcam", global.smoothcam);
					ini_write_real("Settings", "scrntilt", global.screentilt);
					ini_write_real("Settings", "playrot", global.playerrotate);
					ini_close();
					break;
			}
		}
		switch (select)
		{
			case 0:
				arrowy = 97;
				break;
			case 1:
				arrowy = 192;
				break;
			case 2:
				arrowy = 288;
				break;
			case 3:
				arrowy = 383;
				break;
			case 4:
				arrowy = 450;
				break;
		}
		if (key_down2 && select < 4)
		{
			select++;
			scr_sound(sound_step);
		}
		else if (key_down2 && select == 4)
		{
			select = 0;
			scr_sound(sound_step);
		}
		if (key_up2 && select > 0)
		{
			select--;
			scr_sound(sound_step);
		}
		else if (key_up2 && select == 0)
		{
			select = 3;
			scr_sound(sound_step);
		}
		switch (select)
		{
			case 0:
				subtitle = "MAKES THE GAME TAKE UP YOUR WHOLE SCREEN";
				break;
			case 1:
				subtitle = "SMOOTHS OUT CAMERA MOVEMENT";
				break;
			case 2:
				subtitle = "ENABLES SCREEN TILTING DURING ESCAPE";
				break;
			case 3:
				subtitle = "ENABLES PLAYER SPRITES ROTATING ON SLOPES AT HIGH SPEEDS";
				break;
			case 4:
				subtitle = "LEAVE VIDEO SETTINGS";
				break;
		}
		break;
	case "AUDIO":
		break;
	case "KEY":
		break;
	case "MISC":
		break;
}
if (key_slap2 && menu == "HOME")
{
	if (room == realtitlescreen)
		obj_mainfartselect.abletomove = true;
	if (instance_exists(obj_pause))
		obj_pause.canmove = true;
	instance_destroy();
}
if (global.fullscreen && !window_get_fullscreen())
	window_set_fullscreen(true);
else if (!global.fullscreen && window_get_fullscreen())
	window_set_fullscreen(false);
