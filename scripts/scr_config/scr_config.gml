#macro CONFIG global.config
// this is so you can reset it
global.baseconfig =
{
	Superjump_Cancel_Animation : false
}
CONFIG = {}

function config_load()
{
	if (!file_exists("config.yaml")) // if the file doesnt exist, make it the base config.
	{
		var _string = SnapToYAML(global.baseconfig, true);
		string_save(_string, "config.yaml");
	}
	else // else update the config from the yaml file
	{
		var _string = string_load("config.yaml");
		CONFIG = SnapFromYAML(_string);
	}
}
function config_check_integrity()
{
	// hacky solution incoming!!!
	struct_foreach(global.baseconfig, function(_name, _value) 
	{
		if (!struct_exists(CONFIG, _name))
		{
			CONFIG = global.baseconfig;
			var _file = file_text_open_write("config.yaml");
			file_text_write_string(_file, SnapToYAML(CONFIG));
			file_text_close(_file);
			show_message("There was an issue with the config file!\nResetting configuration.");
			exit;
		}
	});
}
config_load();
config_check_integrity();