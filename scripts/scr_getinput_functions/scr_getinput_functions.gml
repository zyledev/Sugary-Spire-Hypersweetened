enum CONTROL_TYPE
{
	keyboard,
	controller,
	mouse
}
// allows for on-the-fly input assignments
function Input(_key, _type = CONTROL_TYPE.keyboard) constructor
{
	check = false;
	pressed = false;
	key = _key;
	type = _type;
}
/* these are global inputs, probably not going to be used much in this project,
   but can be a baseline for how a normal control scheme should look.
   with my input system */
#macro INPUTS global.inputs
function input_init_global()
{
	INPUTS =
	{
		key_up : new Input(global.keybinds.key_up),
		key_down : new Input(global.keybinds.key_down),
		key_left : new Input(global.keybinds.key_left),
		key_right : new Input(global.keybinds.key_right),
		key_jump : new Input(global.keybinds.key_jump),
		key_mach : new Input(global.keybinds.key_attack)
	}
}

// run the input check, defaults to global inputs.
function input_check(input_struct = INPUTS)
{
	struct_foreach(input_struct, function(_name, _value)
	{
		var _check, _check_pressed
		switch (_value.type)
		{
			case CONTROL_TYPE.keyboard:
				_check = keyboard_check;
				_check_pressed = keyboard_check_pressed;
				break;
			case CONTROL_TYPE.controller:
				_check = gamepad_button_check;
				_check_pressed = gamepad_button_check_pressed;
				break;
			case CONTROL_TYPE.mouse:
				_check = mouse_check_button;
				_check_pressed = mouse_check_button_pressed;
				break;
		}
		// really lazy solution to this problem but shouldnt bother anything
		if (_value.type != CONTROL_TYPE.controller)
		{
			_value.check = _check(_value.key);
			_value.pressed = _check_pressed(_value.key);
		}
		else
		{
			_value.check = _check(0, _value.key);
			_value.pressed = _check_pressed(0, _value.key);
		}
	})
}

function scr_keyname(_key)
{
    switch (_key)
	{
        case 37: return "LEFT";
        case 39: return "RIGHT";
        case 38: return "UP";
        case 40: return "DOWN";
        case 13: return "ENTER";
        case 27: return "ESCAPE";
        case 32: return "SPACE";
        case 16: return "SHIFT";
        case 17: return "CONTROL";
        case 18: return "ALT";
        case 8: return "BACKSPACE";
        case 9: return "TAB";
        case 36: return "HOME";
        case 35: return "END";
        case 46: return "DELETE";
        case 45: return "INSERT";
        case 33: return "PAGE UP";
        case 34: return "PAGE DOWN";
        case 19: return "PAUSE";
        case 44: return "PRINTSCREEN";
        case 112: return "F1";
        case 113: return "F2";
        case 114: return "F3";
        case 115: return "F4";
        case 116: return "F5";
        case 117: return "F6";
        case 118: return "F7";
        case 119: return "F8";
        case 120: return "F9";
        case 121: return "F10";
        case 122: return "F11";
        case 123: return "F12";
        case 96: return "NUMPAD 0";
        case 97: return "NUMPAD 1";
        case 98: return "NUMPAD 2";
        case 99: return "NUMPAD 3";
        case 100: return "NUMPAD 4";
        case 101: return "NUMPAD 5";
        case 102: return "NUMPAD 6";
        case 103: return "NUMPAD 7";
        case 104: return "NUMPAD 8";
        case 105: return "NUMPAD 9";
        case 106: return "MULTIPLY";
        case 111: return "DIVIDE";
        case 107: return "ADD";
        case 109: return "SUBTRACT";
        case 110: return "DECIMAL";
        case -1: return "PRESS KEY";
        default: return chr(_key);
    }
}