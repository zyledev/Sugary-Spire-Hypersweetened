// made by veldao (thanks)
// declare input vars
input =
{
	key_up : new Input(global.keybinds.key_up),
	key_down : new Input(global.keybinds.key_down),
	key_jump : new Input(global.keybinds.key_jump)
}
// these are the only things needed, for loop at the end of the create makes the other things.
menu_array = [
["PLAY", mainmenu_playbutton],
["OPTIONS", mainmenu_optionbutton],
["CREDITS", mainmenu_creditsbutton],
["EXIT", mainmenu_exitbutton]

];
// this isnt anywhere in the codebase so im making it myself ig
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

selected = 0;
title_y = 0;
pizzy_sprite = spr_file1NEW;
can_move = true;


for (var l = 0; l < array_length(menu_array); l++)
{
	// 0 is the positioning, 70 is the HSV brightness.
	array_push(menu_array[l], 0, 70);
}
