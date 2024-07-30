input_check(input);

var move = -input.key_up.pressed + input.key_down.pressed;

if (move != 0)
{
	if (selected.value == main_array[selected.folder].length-1 || !main_array[selected.folder].opened)
	{
		selected.folder += move;
	}
	else
		selected.value += move;
		
	selected.folder = clamp(selected.folder, 0, array_length(main_array)-1);
	selected.value = clamp(selected.value, 0, main_array[selected.folder].length-1);
	show_debug_message(string(selected));
}
// open folder
if (input.key_open.pressed)
{
	main_array[selected.folder].opened = !main_array[selected.folder].opened;
	selected.value = 0;
}
if (input.key_confirm.pressed)
{
	
}