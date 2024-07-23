function draw_option(_x, _y, _text, _color)
{
	draw_set_color(c_white);
	if (_color == 0)
		draw_set_color(0x666666);
	draw_text(_x, _y, _text);
	draw_set_color(c_white);
}

function window_size_check(_val)
{
	switch (_val)
	{
		case 0: window_set_size(480, 260); break;
		case 1: window_set_size(960, 540); break;
		case 2: window_set_size(1280, 720); break;
	}
}