gpu_set_fog(true, image_blend, 0, 1000);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
gpu_set_fog(false, 0, 0, 1);
