live_auto_call;
// declare move vars for menu navigation
input_check(input);
var move_y = -input.key_up.pressed + input.key_down.pressed;
var move_x = -input.key_left.pressed + input.key_right.pressed;
// needed for slider
var move_x2 = -input.key_left.check + input.key_right.check;
// DEBUG STUFF REMOVE WHEN DONE
obj_player.state = states.actor;
if (!keybinding)
{
	// category movement
	if (category_chosen == undefined)
	{
		// movement
		if (move_y != 0)
		{
			category_selected += move_y;
			category_selected = clamp(category_selected, 0, struct_length-1);
		}
		// confirm button
		if (input.key_confirm.pressed)
			category_chosen = options[$ struct_names[category_selected]]
		// back button
		if (input.key_back.pressed)
			instance_destroy();
	}
	else // when inside category
	{
		var _option_array = options[$ struct_names[category_selected]];
		var _struct = _option_array[option_selected];
		// movement
		if (move_x != 0 || move_y != 0 || move_x2 != 0)
		{
			option_selected += move_y;
			option_selected = clamp(option_selected, 0, array_length(_option_array)-1);
			// switch statement for all option types (its time for things to get messy)
			switch (_struct.type)
			{
				case OPTIONTYPE.toggle:
					if (move_x != 0)
						_struct.active_option = !_struct.active_option;
					// clamp to true and false
					_struct.active_option = clamp(_struct.active_option, 0, 1);
					break;
				case OPTIONTYPE.multichoice:
					_struct.active_option += move_x;
					_struct.active_option = clamp(_struct.active_option, 0, array_length(_struct.choices)-1);
					break;
				case OPTIONTYPE.slider:
					_struct.active_option += move_x2;
					_struct.active_option = clamp(_struct.active_option, 0, 100);
					_struct.callback(_struct.active_option); // so the value updates
					break;
			}
		}

		// confirm button
		if (input.key_confirm.pressed)
		{
			_struct.callback(_struct.active_option);
		}
		// back button
		if (input.key_back.pressed)
		{
			// save options
		
			ini_open("optionData.ini");
			for (var i = 0; i < array_length(_option_array); i++;)
			{
				_option_array[i].callback(_option_array[i].active_option); // run this so the options apply
				ini_write_real(_option_array[i].ini_keys[0], _option_array[i].ini_keys[1], _option_array[i].active_option);
			}
			ini_close();
			category_chosen = undefined;
		}
	}
}
else
{
	show_debug_message("this is running")
	if (keyboard_check_pressed(vk_anykey))
	{
		global.keybinds[$ key_to_change] = keyboard_lastchar;
		keybinding = false;
		key_to_change = undefined;
	}
}