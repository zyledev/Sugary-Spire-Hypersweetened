pal_swap_set(spr_palette, paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, draw_angle, image_blend, image_alpha);
shader_reset();
if (flash)
{
	shader_set(shd_hit);
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, draw_angle, image_blend, image_alpha);
	shader_reset();
}
if (flash && alarm[11] <= 0)
	alarm[11] = 5;
shader_reset();
if (global.debugmode)
{
	draw_set_font(font_dev);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(x, y - 50, "State: " + string(state) + ", " + string(stateName));
	draw_text(x, y - 100, movespeed);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	draw_set_halign(fa_left);
}
