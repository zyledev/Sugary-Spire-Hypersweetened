// this object is replaced by config.yaml
function make_folder(_name, _arr)
{
	return { name : _name, opened : false, internal_options : _arr, length : array_length(_arr) }
}
function make_config(_name, _ini_keys)
{
	return { name : _name, ini_keys : _ini_keys, value : ini_read_real(_ini_keys[0], _ini_keys[1], 0)}
}
filedir = working_directory + "config.yaml";

obj_player.state = states.titlescreen;
input = 
{
	key_up : new Input(global.keybinds.key_up),
	key_down : new Input(global.keybinds.key_down),
	key_confirm : new Input(global.keybinds.key_jump),
	key_open : new Input(global.keybinds.key_taunt)
};
selected = { folder : 0, value : 0};
ini_open("Hypersweetened/configs.ini");
main_array =
[
	make_folder("Gameplay",
	[
		make_config("Superjump Cancel", ["Configs", "SJumpcancel"]),
		make_config("Superjump Cancel", ["Configs", "SJumpcancel"])
	]),
	make_folder("Visual",
	[
		make_config("Superjump Cancel", ["Configs", "SJumpcancel"]),
	]),
	make_folder("Misc.",
	[
		make_config("Superjump Cancel", ["Configs", "SJumpcancel"]),
	])
];

ini_close();

