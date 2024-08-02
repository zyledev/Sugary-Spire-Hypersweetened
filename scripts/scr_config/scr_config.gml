#macro CONFIG global.config
// this is so you can reset it
global.baseconfig =
{
	Superjump_Cancel_Animation : false
}
CONFIG = {}


if (!file_exists("config.yaml"))
{
	CONFIG = global.baseconfig;
	var _file = file_text_open_write("config.yaml");
	file_text_write_string(_file, SnapToYAML(CONFIG));
	file_text_close(_file);
}
else
{
	var _buffer = buffer_load("config.yaml");
	CONFIG = SnapBufferReadYAML(_buffer, 0);
	buffer_delete(_buffer);
}

// hacky solution incoming!!!
struct_foreach(global.baseconfig, function(_name, _value) 
{
	if (!variable_struct_exists(CONFIG, _name))
	{
		CONFIG = global.baseconfig;
		var _file = file_text_open_write("config.yaml");
		file_text_write_string(_file, SnapToYAML(CONFIG));
		file_text_close(_file);
		show_message("There was an issue with the config file!\nResetting gameplay configuration.");
		exit;
	}
});