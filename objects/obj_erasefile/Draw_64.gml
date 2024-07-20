draw_set_alpha(0.95);
draw_rectangle_color(-32, -32, 992, 572, 0, 0, 0, 0, 0);
draw_set_alpha(1);
draw_set_font(145);
draw_set_halign(fa_center);
draw_text(480, 190, "ARE YOU SURE YOU WANT\nTO ERASE YOUR SAVE FILE!");
draw_option(400, 300, "NO", optionselected == 0);
if (optionselected == 1)
	draw_text_colour(560, 300, "YES", c_red, c_red, c_red, c_red, 1);
else
{
	draw_text_colour(560, 300, "YES", c_black, c_black, c_black, c_black, 1);
	draw_text_colour(560, 300, "YES", c_red, c_red, c_red, c_red, 0.5);
}
