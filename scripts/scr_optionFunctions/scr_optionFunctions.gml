function draw_option(_x, _y, _text, _color)
{
	draw_set_color(c_white);
	if (_color == 0)
		draw_set_color(0x666666);
	draw_text(_x, _y, _text);
	draw_set_color(c_white);
}
