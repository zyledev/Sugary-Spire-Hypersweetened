enum option_selected
{
	back,
	audio,
	video,
	input,
	misc
}
input = 
{
	key_up : new Input(global.keybinds.key_up),
	key_down : new Input(global.keybinds.key_down),
	key_confirm : new Input(global.keybinds.key_jump),
	key_back : new Input(global.keybinds.key_slap),
	key_start : new Input(global.keybinds.key_start)
}
image_speed = 0.35;
CursorX = 0;
CursorY = 0;
bgx = 0;
bgy = 0;
depth = -99;
PauseMusic = -4;
if (room != realtitlescreen)
{
	PauseMusic = scr_soundloop(mu_paletteselect);
	audio_sound_set_track_position(PauseMusic, global.PAUSEfadeoff);
}
subtitle = "GO BACK TO MAIN SCREEN";
optionselected = option_selected.back;
selected = false;
