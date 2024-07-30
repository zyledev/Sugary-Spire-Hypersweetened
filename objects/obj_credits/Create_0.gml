credits_text = "";
file_dir = working_directory + "credits.txt";
// if file exists do this
if (file_exists(file_dir))
{
	// open the file for reading
	file = file_text_open_read(file_dir)
	// while file isnt over, read each line
	while (!file_text_eof(file))
	    credits_text += file_text_readln(file);
	// close the file when done
	file_text_close(file);
}
// declare input and position vars
input = { key_exit : new Input(global.keybinds.key_jump) };
_y = -50;
max_height = _y < string_height(credits_text)