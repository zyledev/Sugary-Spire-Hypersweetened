function scr_initinput()
{
	ini_open("optionData.ini");
	global.key_up = ini_read_string("ControlsKeys", "up", vk_up);
	global.key_right = ini_read_string("ControlsKeys", "right", vk_right);
	global.key_left = ini_read_string("ControlsKeys", "left", vk_left);
	global.key_down = ini_read_string("ControlsKeys", "down", vk_down);
	global.key_jump = ini_read_string("ControlsKeys", "jump", ord("Z"));
	global.key_slap = ini_read_string("ControlsKeys", "slap", ord("X"));
	global.key_taunt = ini_read_string("ControlsKeys", "taunt", ord("C"));
	global.key_shoot = ini_read_string("ControlsKeys", "shoot", ord("A"));
	global.key_attack = ini_read_string("ControlsKeys", "attack", vk_shift);
	global.key_start = ini_read_string("ControlsKeys", "start", vk_escape);
	global.key_special = ini_read_string("ControlsKeys", "special", ord("V"));
	// Controller
    global.key_upC = ini_read_string("ControllerButton", "up", gp_padu);
    global.key_rightC = ini_read_string("ControllerButton", "right", gp_padr);
    global.key_leftC = ini_read_string("ControllerButton", "left", gp_padl);
    global.key_downC = ini_read_string("ControllerButton", "down", gp_padd);
    global.key_jumpC = ini_read_string("ControllerButton", "jump", gp_face1);
    global.key_slapC = ini_read_string("ControllerButton", "slap", gp_face3);
    global.key_tauntC = ini_read_string("ControllerButton", "taunt", gp_face4);
    global.key_shootC = ini_read_string("ControllerButton", "shoot", gp_face2);
    global.key_attackC = ini_read_string("ControllerButton", "attack", gp_shoulderr);
    global.key_startC = ini_read_string("ControllerButton", "start", gp_start);
    global.key_specialC = ini_read_string("ControllerButton", "special", gp_shoulderl);
	ini_close();
}
function scr_resetinput()
{
	ini_open("optionData.ini");
	ini_write_string("ControlsKeys", "up", vk_up);
	ini_write_string("ControlsKeys", "right", vk_right);
	ini_write_string("ControlsKeys", "left", vk_left);
	ini_write_string("ControlsKeys", "down", vk_down);
	ini_write_string("ControlsKeys", "jump", ord("Z"));
	ini_write_string("ControlsKeys", "slap", ord("X"));
	ini_write_string("ControlsKeys", "taunt", ord("C"));
	ini_write_string("ControlsKeys", "shoot", ord("A"));
	ini_write_string("ControlsKeys", "attack", vk_shift);
	ini_write_string("ControlsKeys", "start", vk_escape);
	ini_write_string("ControlsKeys", "special", ord("V"));
    ini_write_string("ControllerButton", "up", gp_padu);
    ini_write_string("ControllerButton", "right", gp_padr);
    ini_write_string("ControllerButton", "left", gp_padl);
    ini_write_string("ControllerButton", "down", gp_padd);
    ini_write_string("ControllerButton", "jump", gp_face1);
    ini_write_string("ControllerButton", "slap", gp_face3);
    ini_write_string("ControllerButton", "taunt", gp_face4);
    ini_write_string("ControllerButton", "shoot", gp_face2);
    ini_write_string("ControllerButton", "attack", gp_shoulderr);
    ini_write_string("ControllerButton", "start", gp_start);
    ini_write_string("ControllerButton", "special", gp_shoulderl);
    scr_initinput();
	ini_close();
}
