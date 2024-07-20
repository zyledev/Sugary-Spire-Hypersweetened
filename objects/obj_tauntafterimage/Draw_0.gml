shader_set(shd_afterimage);
var colorblend1 = shader_get_uniform(shd_afterimage, "blendcolor1");
shader_set_uniform_f(colorblend1, realcol.r / 255, realcol.g / 255, realcol.b / 255);
var colorblend2 = shader_get_uniform(shd_afterimage, "blendcolor2");
shader_set_uniform_f(colorblend2, realcol.r2 / 255, realcol.g2 / 255, realcol.b2 / 255);
draw_sprite_ext(sprite_index, storedimage, x, y, image_xscale, image_yscale, draw_angle, c_white, gonealpha * image_alpha);
shader_reset();
draw_sprite_ext(spr_supertauntcharge, image_index, x, y, image_xscale, image_yscale, draw_angle, c_white, gonealpha);
