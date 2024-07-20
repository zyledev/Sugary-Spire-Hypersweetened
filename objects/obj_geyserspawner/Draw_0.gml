var _xscale = 1 + ((image_xscale - 1) / 3);
if (!instance_exists(SpoutID))
{
	draw_sprite_ext(spr_geyserIdle, Imageindex, x - 32, y - 32, _xscale, 1, image_angle, image_blend, image_alpha);
	draw_sprite_ext(spr_geysercloud, Imageindex, x - 32, y - 32, round(_xscale), 1, image_angle, image_blend, image_alpha);
}
else
	draw_sprite_ext(spr_geyseractive, Imageindex, x - 32, y - 32, _xscale, 1, image_angle, image_blend, image_alpha);
