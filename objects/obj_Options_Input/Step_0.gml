if (canmove)
{
	scr_getinput();
	ScrollY = lerp(ScrollY, (optionselected / 11) * -100, 0.15);
	if (!selecting)
	{
		if ((input.key_up.pressed || keyboard_check_pressed(vk_up)) && optionselected > 0)
		{
			optionselected -= 1;
			scr_sound(sound_step);
		}
		if ((key_down2 || keyboard_check_pressed(vk_down)) && optionselected < 11)
		{
			optionselected += 1;
			scr_sound(sound_step);
		}
		if (input.key_attack.pressed || key_start)
		{
			ini_open("optionData.ini");
			ini_write_string("ControlsKeys", "up", global.keybinds.key_up);
			ini_write_string("ControlsKeys", "right", global.keybinds.key_right);
			ini_write_string("ControlsKeys", "left", global.keybinds.key_left);
			ini_write_string("ControlsKeys", "down", global.keybinds.key_down);
			ini_write_string("ControlsKeys", "jump", global.keybinds.key_jump);
			ini_write_string("ControlsKeys", "slap", global.keybinds.key_slap);
			ini_write_string("ControlsKeys", "taunt", global.keybinds.key_taunt);
			ini_write_string("ControlsKeys", "attack", global.keybinds.key_attack);
			ini_write_string("ControlsKeys", "start", global.keybinds.key_start);
			ini_write_string("ControlsKeys", "special", global.key_special);
			ini_close();
			scr_sound(sound_enemythrow);
			instance_destroy();
		}
	}
	switch (optionselected)
	{
		case 0:
			subtitle = "";
			if (key_jump || keyboard_check_pressed(vk_enter))
			{
				ini_open("optionData.ini");
				ini_write_string("ControlsKeys", "up", global.keybinds.key_up);
				ini_write_string("ControlsKeys", "right", global.keybinds.key_right);
				ini_write_string("ControlsKeys", "left", global.keybinds.key_left);
				ini_write_string("ControlsKeys", "down", global.keybinds.key_down);
				ini_write_string("ControlsKeys", "jump", global.keybinds.key_jump);
				ini_write_string("ControlsKeys", "slap", global.keybinds.key_slap);
				ini_write_string("ControlsKeys", "taunt", global.keybinds.key_taunt);
				ini_write_string("ControlsKeys", "attack", global.keybinds.key_attack);
				ini_write_string("ControlsKeys", "start", global.keybinds.key_start);
				ini_write_string("ControlsKeys", "special", global.key_special);
				ini_close();
				scr_sound(sound_enemythrow);
				instance_destroy();
			}
			break;
		case input_selected.up:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_up = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_up = -1;
			}
			break;
		case input_selected.right:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_right = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == 0)
			{
				selecting = true;
				global.keybinds.key_right = -1;
			}
			break;
		case input_selected.left:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_left = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_left = -1;
			}
			break;
		case input_selected.down:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_down = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_down = -1;
			}
			break;
		case input_selected.jump:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_jump = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_jump = -1;
			}
			break;
		case input_selected.slap:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_slap = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_slap = -1;
			}
			break;
		case input_selected.taunt:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_taunt = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_taunt = -1;
			}
			break;
		case input_selected.shoot:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.key_shoot = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.key_shoot = -1;
			}
			break;
		case input_selected.attack:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_attack = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_attack = -1;
			}
			break;
		case input_selected.start:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.keybinds.key_start = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.keybinds.key_start = -1;
			}
			break;
		case input_selected.special:
			subtitle = "";
			if (selecting)
			{
				if (keyboard_check_pressed(vk_anykey))
				{
					global.key_special = keyboard_key;
					selecting = false;
				}
			}
			if ((key_jump || keyboard_check_pressed(vk_enter)) && !selecting)
			{
				selecting = true;
				global.key_special = -1;
			}
			break;
	}
}
