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
