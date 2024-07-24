input = 
{
	key_up : new Input(global.keybinds.key_up),
	key_down : new Input(global.keybinds.key_down),
	key_left : new Input(global.keybinds.key_left),
	key_right : new Input(global.keybinds.key_right),
	key_confirm : new Input(global.keybinds.key_jump),
	key_back : new Input(global.keybinds.key_slap),
	key_boost : new Input(global.keybinds.key_attack),
	key_esc : new Input(global.keybinds.key_start)
}
enum audio_selected
{
	back,
	master,
	music,
	sfx
}
ini_open("optionData.ini");
global.musicVolume = ini_read_real("Settings", "musicvol", 1);
global.soundVolume = ini_read_real("Settings", "soundvol", 1);
global.masterVolume = ini_read_real("Settings", "mastervol", 1);
ini_close();
optionsaved_masterVolume = global.masterVolume;
optionsaved_musicVolume = global.musicVolume;
optionsaved_soundVolume = global.soundVolume;
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
depth = -100;
selecting = -1;
optionselected = audio_selected.back;
obj_Options_Main.CursorY = -999;
canmove = false;
alarm[0] = 1;
