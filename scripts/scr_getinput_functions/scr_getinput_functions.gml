function scr_getinput()
{
	key_up = false;
	key_up2 = false;
	key_right = false;
	key_right2 = false;
	key_left = false;
	key_left2 = false;
	key_down = false;
	key_down2 = false;
	key_jump = false;
	key_jump2 = false;
	key_slap = false;
	key_slap2 = false;
	key_taunt = false;
	key_taunt2 = false;
	key_attack = false;
	key_attack2 = false;
	key_shoot = false;
	key_shoot2 = false;
	key_start = false;
	key_start2 = false;
	key_escape = false;
	stickpressed = false;
	if (global.shellactivate)
		exit;
	if (keyboard_check_pressed(vk_f1))
		scr_resetinput();
	var _dvc = 0;
	gamepad_set_axis_deadzone(_dvc, 0.4);
	key_up = keyboard_check(global.key_up) || gamepad_button_check(_dvc, global.key_upC) || gamepad_axis_value(_dvc, gp_axislv) < 0;
	key_up2 = keyboard_check_pressed(global.key_up) || gamepad_button_check_pressed(_dvc, global.key_upC) || (gamepad_axis_value(_dvc, gp_axislv) < -0.5 && !stickpressed);
	key_right = keyboard_check(global.key_right) || gamepad_button_check(_dvc, global.key_rightC) || gamepad_axis_value(_dvc, gp_axislh) > 0;
	key_right2 = keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(_dvc, global.key_rightC) || (gamepad_axis_value(_dvc, gp_axislh) > 0.5 && !stickpressed);
	key_left = -(keyboard_check(global.key_left) || gamepad_button_check(_dvc, global.key_leftC) || gamepad_axis_value(_dvc, gp_axislh) < 0);
	key_left2 = -(keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(_dvc, global.key_leftC) || (gamepad_axis_value(_dvc, gp_axislh) < -0.5 && !stickpressed));
	key_down = keyboard_check(global.key_down) || gamepad_button_check(_dvc, global.key_downC) || gamepad_axis_value(_dvc, gp_axislv) > 0;
	key_down2 = keyboard_check_pressed(global.key_down) || gamepad_button_check_pressed(_dvc, global.key_downC) || (gamepad_axis_value(_dvc, gp_axislv) > 0.5 && !stickpressed);
	key_jump2 = keyboard_check(global.key_jump) || gamepad_button_check(_dvc, global.key_jumpC);
	key_jump = keyboard_check_pressed(global.key_jump) || gamepad_button_check_pressed(_dvc, global.key_jumpC);
	key_slap = keyboard_check(global.key_slap) || gamepad_button_check(_dvc, global.key_slapC);
	key_slap2 = keyboard_check_pressed(global.key_slap) || gamepad_button_check_pressed(_dvc, global.key_slapC);
	key_taunt = keyboard_check(global.key_taunt) || gamepad_button_check(_dvc, global.key_tauntC);
	key_taunt2 = keyboard_check_pressed(global.key_taunt) || gamepad_button_check_pressed(_dvc, global.key_tauntC);
	key_attack = keyboard_check(global.key_attack) || gamepad_button_check(_dvc, global.key_attackC) || gamepad_button_check(_dvc, gp_shoulderrb);
	key_attack2 = keyboard_check_pressed(global.key_attack) || gamepad_button_check_pressed(_dvc, global.key_attackC) || gamepad_button_check_pressed(_dvc, gp_shoulderrb);
	key_shoot = keyboard_check(global.key_shoot) || gamepad_button_check(_dvc, global.key_shootC);
	key_shoot2 = keyboard_check_pressed(global.key_shoot) || gamepad_button_check_pressed(_dvc, global.key_shootC) || gamepad_button_check_pressed(_dvc, gp_shoulderl);
	key_start = keyboard_check(global.key_start) || gamepad_button_check(_dvc, global.key_startC);
	key_start2 = keyboard_check_pressed(global.key_start) || gamepad_button_check_pressed(_dvc, global.key_startC);
	key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select);
	if (gamepad_axis_value(_dvc, gp_axislh) > 0.5 || gamepad_axis_value(_dvc, gp_axislh) < -0.5 || gamepad_axis_value(_dvc, gp_axislv) > 0.5 || gamepad_axis_value(_dvc, gp_axislv) < -0.5)
		stickpressed = true;
	else
		stickpressed = false;
	return true;
}
function scr_keyname(_key)
{
	if (_key == 37)
		return "LEFT";
	if (_key == 39)
		return "RIGHT";
	if (_key == 38)
		return "UP";
	if (_key == 40)
		return "DOWN";
	if (_key == 13)
		return "ENTER";
	if (_key == 27)
		return "ESCAPE";
	if (_key == 32)
		return "SPACE";
	if (_key == 16)
		return "SHIFT";
	if (_key == 17)
		return "CONTROL";
	if (_key == 18)
		return "ALT";
	if (_key == 8)
		return "BACKSPACE";
	if (_key == 9)
		return "TAB";
	if (_key == 36)
		return "HOME";
	if (_key == 35)
		return "END";
	if (_key == 46)
		return "DELETE";
	if (_key == 45)
		return "INSERT";
	if (_key == 33)
		return "PAGE UP";
	if (_key == 34)
		return "PAGE DOWN";
	if (_key == 19)
		return "PAUSE";
	if (_key == 44)
		return "PRINTSCREEN";
	if (_key == 112)
		return "F1";
	if (_key == 113)
		return "F2";
	if (_key == 114)
		return "F3";
	if (_key == 115)
		return "F4";
	if (_key == 116)
		return "F5";
	if (_key == 117)
		return "F6";
	if (_key == 118)
		return "F7";
	if (_key == 119)
		return "F8";
	if (_key == 120)
		return "F9";
	if (_key == 121)
		return "F10";
	if (_key == 122)
		return "F11";
	if (_key == 123)
		return "F12";
	if (_key == 96)
		return "NUMPAD 0";
	if (_key == 97)
		return "NUMPAD 1";
	if (_key == 98)
		return "NUMPAD 2";
	if (_key == 99)
		return "NUMPAD 3";
	if (_key == 100)
		return "NUMPAD 4";
	if (_key == 101)
		return "NUMPAD 5";
	if (_key == 102)
		return "NUMPAD 6";
	if (_key == 103)
		return "NUMPAD 7";
	if (_key == 104)
		return "NUMPAD 8";
	if (_key == 105)
		return "NUMPAD 9";
	if (_key == 106)
		return "MULTIPLY";
	if (_key == 111)
		return "DIVIDE";
	if (_key == 107)
		return "ADD";
	if (_key == 109)
		return "SUBTRACT";
	if (_key == 110)
		return "DECIMAL";
	if (_key == -1)
		return "PRESS KEY";
	return chr(_key);
}
