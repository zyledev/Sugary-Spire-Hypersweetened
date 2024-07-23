// this code is a bit messy
scr_resetinput();	
obj_player.state = states.actor;
declare_input = function()
{
	input = 
	{
		key_up : new Input(global.keybinds.key_up),
		key_down : new Input(global.keybinds.key_down),
		key_left : new Input(global.keybinds.key_left),
		key_right : new Input(global.keybinds.key_right),
		key_confirm : new Input(global.keybinds.key_jump),
		key_back : new Input(global.keybinds.key_slap)
	}
}
declare_input();
enum OPTIONTYPE
{
	toggle,
	multichoice,
	slider,
	keymap
}
function new_option(_name, _ini_keys = [], _type, _func, options = [])
{
	ini_open("optionData.ini");
	var _ini = ini_read_real(_ini_keys[0], _ini_keys[1], _type == OPTIONTYPE.slider ? 100 : 0);
	ini_close();
	return { name : _name, ini_keys : _ini_keys, type : _type, callback : _func, active_option : _ini, choices : options }
}

category_selected = 0;
category_chosen = undefined;

option_selected = 0;

// keybinding
keybinding = false;
key_to_change = "";
// argument for the callback
options =
{
	video :
	[
		new_option("Toggle Fullscreen", ["Settings", "fullscrn"], OPTIONTYPE.toggle, function(_val) { window_set_fullscreen(_val); }),
		new_option("Change Window Size", ["Settings", "resolution"], OPTIONTYPE.multichoice, function(_val) { window_size_check(_val); }, ["480X260", "960X540", "1280X720"]),
		new_option	("Smooth Camera", ["Settings", "smthcam"], OPTIONTYPE.toggle, function(_val) { global.smoothcam = _val; }),
		new_option("Screen Tilt", ["Settings", "scrntilt"], OPTIONTYPE.toggle, function(_val) { global.screentilt = _val; })
	],
	audio : 
	[
		new_option("Master Volume", ["Settings", "mastervol"], OPTIONTYPE.slider, function(_val) { global.masterVolume = _val / 100; audio_master_gain(global.masterVolume); }),
		new_option("Music Volume", ["Settings", "musicvol"], OPTIONTYPE.slider, function(_val) { global.musicVolume = _val / 100; audio_sound_gain(global.music, _val, 0); }),
		new_option("SFX Volume", ["Settings", "soundvol"], OPTIONTYPE.slider, function(_val) { global.soundVolume = _val / 100; })
	],
	input :
	[
		new_option("Up", ["ControlsKeys", "up"], OPTIONTYPE.keymap, function() { set_input("key_up"); }),
		new_option("Right", ["ControlsKeys", "right"], OPTIONTYPE.keymap, function() { set_input("key_right"); }),
		new_option("Left", ["ControlsKeys", "left"], OPTIONTYPE.keymap, function() { set_input("key_left"); }),
		new_option("Down", ["ControlsKeys", "down"], OPTIONTYPE.keymap, function() { set_input("key_down"); }),
		new_option("Jump", ["ControlsKeys", "jump"], OPTIONTYPE.keymap, function() { set_input("key_jump"); }),
		new_option("Grab", ["ControlsKeys", "slap"], OPTIONTYPE.keymap, function() { set_input("key_slap"); }),
		new_option("Taunt", ["ControlsKeys", "taunt"], OPTIONTYPE.keymap, function() { set_input("key_taunt"); }),
		new_option("Attack", ["ControlsKeys", "attack"], OPTIONTYPE.keymap, function() { set_input("key_attack"); })
	],
}

struct_length = struct_names_count(options);
struct_names = variable_struct_get_names(options);
// funky sorting stuff to make it consistent
array_sort(struct_names, true)
struct_names = array_reverse(struct_names);

function set_input(_str)
{
	show_debug_message("yeah" + string(_str))
	keybinding = true;
	key_to_change = _str
}