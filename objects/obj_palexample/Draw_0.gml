pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
pal_swap_reset();
