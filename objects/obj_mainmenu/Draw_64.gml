// bla bla bla basic positioning and font setting
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.font);
draw_set_color(c_white);
// time to make some temp vars
var spacing = 0;
// 35 for the pinkish tint, 70 for the darker shade.
var sel_color = make_color_hsv(0, 35, 70);
// magic random math that will position the y axis better.
var set_position = -150;

// draws the title icon with a wave effect.
title_y = wave(4, -4, 4, -4);
draw_sprite(spr_title, 0, 200, 100 + title_y);
// for loop of DOOM
for (var i = 0; i < array_length(menu_array); i++;)
{
	var length = array_length(menu_array[i])-1;
	if (selected == i)
	{
		//color
		menu_array[i][length] = lerp(menu_array[i][length], 255, 0.1);
		//positioning
		menu_array[i][length-1] = lerp(menu_array[i][length-1], -40, 0.1);
	}	
	else
	{
		//color
		menu_array[i][length] = lerp(menu_array[i][length], 200, 0.1);
		//positioning
		menu_array[i][length-1] = lerp(menu_array[i][length-1], 0, 0.1);
	}
	// this var declaration is unoptimal, but better code readability!!
	var selected_x = menu_array[i][length-1];
	// sets the color to the shifted color
	sel_color = make_color_hsv(0, 35, menu_array[i][length]);
	// roundrect my beloved
	draw_roundrect_color(gui_width - 250 + selected_x, gui_height - 200 + spacing + set_position, gui_width + 100, gui_height - 300 + spacing + set_position, sel_color, sel_color, false);
	draw_text(gui_width - 230 + selected_x, gui_height - 280 + spacing + set_position, menu_array[i][0]);
	spacing += 100;
}