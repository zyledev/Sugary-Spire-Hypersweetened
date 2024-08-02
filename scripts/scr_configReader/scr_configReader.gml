function hsc_parse(_key, _file = "config.hsc")
{
    var _cur_line = 0, _str_pos = 0;
	if (!file_exists(_file))
	{
		var _createfile = file_text_open_write(_file)
		file_text_close(_createfile);
		return false;
	}
    var _opened_file = file_text_open_read(_file);
    while (!file_text_eof(_opened_file)) // while its not the end of the file
    {
        _cur_line = file_text_readln(_opened_file); // read all lines
        
        if (string_pos(_key, _cur_line) != 0 && string_pos(":", _cur_line) != 0)
        {
            _str_pos = string_pos(_key, _cur_line);

            var _firstchar = string_delete(_key, 2, string_length(_key)) // get the first character of the key.

            if (string_char_at(_cur_line, _str_pos - 1) == _firstchar || 
            string_char_at(_cur_line, _str_pos-1) == " " &&
			string_char_at(_cur_line, _str_pos+string_length(_key)) == ":" || 
            string_char_at(_cur_line, _str_pos+string_length(_key)) == " ")
			{
				var _sep = string_pos(":", _cur_line);
				var _index = string_delete(_cur_line, _sep-1, 999);
				var _type; // not making an enum for this, 0 == int and 1 == str
				var _value_1 = string_delete(_cur_line, 1, _sep+1);
				var _value_2 = string_delete(_value_1, string_length(_cur_line)-1, 1);
				if (string_letters(_value_2) == "" && string_digits(_value_2) == _value_2)
					_type = 0;
				else
					_type = 1;
				show_debug_message(string(_value_2))
				var _struct = {};
				file_text_close(_opened_file);
				_struct[$ _index] = (_type == 0) ? real(_value_2) : _value_2;
				return _struct;
				
				
			}
        }
    }
	return undefined;
}

function hsc_exists(_key, _file = "config.hsc")
{
	var _cur_line;
	if (!file_exists(_file))
	{
		var _createfile = file_text_open_write(_file)
		file_text_close(_createfile);
		return false;
	}
    var _opened_file = file_text_open_read(_file);
    while (!file_text_eof(_opened_file)) // while its not the end of the file
    {
        _cur_line = file_text_readln(_opened_file); // read all lines
        
        if (string_pos(_key, _cur_line) != 0 && string_pos(":", _cur_line) != 0)
        {
            var _str_pos = string_pos(_key, _cur_line);

            var _firstchar = string_delete(_key, 2, string_length(_key)) // get the first character of the key.

            if (string_char_at(_cur_line, _str_pos - 1) == _firstchar || 
            string_char_at(_cur_line, _str_pos-1) == " " &&
			string_char_at(_cur_line, _str_pos+string_length(_key)) == ":" || 
            string_char_at(_cur_line, _str_pos+string_length(_key)) == " ")
			{
				file_text_close(_opened_file);
				return true;
			}
        }
    }
	file_text_close(_opened_file);
	return false;
}

function hsc_create(_key, _value, _file = "config.hsc", _comment = "")
{
	if (!file_exists(_file))
	{
		var _createfile = file_text_open_write(_file)
		file_text_close(_createfile);
		return false;
	}
	if (hsc_exists(_key, _file))
		exit;
	var file = file_text_open_write(_file);
	file_text_write_string(file, "# " + _comment);
	file_text_writeln(file);
    file_text_write_string(file, $"{_key} : {_value}");
	file_text_writeln(file);
	file_text_close(file);
}


///@description - Obtains a value from a key
function hsc_read(_key, _file = "config.hsc")
{
	if (hsc_exists(_key, _file))
		return hsc_parse(_key, _file);
	else
		return undefined;
}
var hello = hsc_read("test");
show_debug_message(string(hello))
