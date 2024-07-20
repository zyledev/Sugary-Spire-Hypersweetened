var _x = x;
var _y = y;
if (is_error)
{
	_x += random_range(-error_shake, error_shake);
	_y += random_range(-error_shake, error_shake);
}
draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, image_angle, c_white, 1);
if (drawing)
{
	draw_set_font(font_dev);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x, y - 32, message);
}
