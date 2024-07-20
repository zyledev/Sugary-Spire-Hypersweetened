if (thrown)
{
	angle += 12;
	angle %= 360;
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
if (flash)
{
	shader_set(shd_hit);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
	shader_reset();
}
if (global.debugmode)
{
	draw_set_font(global.font);
	draw_text(x, y - 50, state);
	draw_text(x, y - 150, movespeed);
	if (object_index == obj_cottonwitch)
		draw_text(x, y - 100, bombreset);
	if (object_index == obj_sluggy)
	{
		draw_text(x, y - 100, idletimer);
		draw_text(x, y - 150, jumptimer);
	}
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}
