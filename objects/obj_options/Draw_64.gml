live_auto_call;
var _old_draw = new save_draw_vars()
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_font(global.font);
var spacing

if (category_chosen == undefined) // draw categories
{
	spacing = 0;
	for (var i = 0; i < struct_length; i++;)
	{
		var _color = category_selected == i ? c_green : c_white
		draw_set_color(_color)
		draw_text(10, 60 + spacing, string_upper(struct_names[i]));
		spacing += 60;
	}
}
else // draw options
{
	var _option_array = options[$ struct_names[category_selected]];
	spacing = 0;
	for (var i = 0; i < array_length(_option_array); i++;)
	{
		var _struct = _option_array[i];
		var _color = option_selected == i ? c_green : c_white
		draw_set_color(_color)
		draw_text(10, 60 + spacing, string_upper(_struct.name));
		spacing += 60;
	}
	
}

if (keybinding)
{
	draw_set_alpha(0.4);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	draw_set_alpha(1);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, "PRESS ANY KEY TO BIND")
}
load_draw_vars(_old_draw)