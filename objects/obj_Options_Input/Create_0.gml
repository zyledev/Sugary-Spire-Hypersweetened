enum input_selected
{
	back,
	up,
	right,
	left,
	down,
	jump,
	slap,
	taunt,
	shoot,
	attack,
	start,
	special
}
input = 
{
	key_up : new Input(global.keybinds.key_up),
	key_down : new Input(global.keybinds.key_down),
	key_confirm : new Input(global.keybinds.key_jump),
	key_back : new Input(global.keybinds.key_slap),
	key_start : new Input(global.keybinds.key_start),
	key_attack : new Input(global.keybinds.key_attack)
	
}
optionselected = input_selected.back;
scr_initinput();
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
ScrollY = 0;
depth = -100;
selecting = false;
obj_Options_Main.CursorY = -999;
canmove = false;
alarm[0] = 1;
