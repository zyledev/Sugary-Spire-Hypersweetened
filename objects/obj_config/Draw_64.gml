var spacing = 0;
var _c = c_white;
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(main_array); i++;)
{
	draw_set_font(global.creditsfont);
	_c = (selected.folder == i) ? c_white : c_gray;
	draw_set_color(_c);
	draw_text(30, 30 + spacing, string(main_array[i].name));
	spacing += string_height(main_array[i].name) + 10;
	if (main_array[i].opened)
	{
		for (var l = 0; l < array_length(main_array[i].internal_options); l++;)
		{
			draw_set_font(global.smallfont);
			_c = (selected.value == l && i == selected.folder) ? c_white : c_gray;
			draw_set_color(_c);
			draw_text(50, 30 + spacing, string_upper(main_array[i].internal_options[l].name));
			spacing += string_height(main_array[i].internal_options[l].name) + 10;
		}
	}
	
}