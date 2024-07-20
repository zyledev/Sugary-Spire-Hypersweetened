draw_set_color(c_white);
draw_rectangle(-64, -64, camera_get_view_width(view_camera[0]) + 64, camera_get_view_height(view_camera[0]) + 64, false);
pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();
