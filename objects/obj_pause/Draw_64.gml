if (global.pause)
{
	if (sprite_exists(screenshot))
		draw_sprite_ext(screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
	draw_set_alpha(alpha);	
	alpha += 0.1;
	alpha = clamp(alpha, 0, 1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	scroll += 0.5
	draw_sprite_tiled(bg_paused, 1, scroll, scroll);
	draw_rectangle_color(-5000, 0, 0, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_rectangle_color(960, 0, 5960, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_sprite(spr_pause, 0, 0, 0);
	// draw confecti
	draw_sprite(spr_pauseconfecti1, global.mallowfollow, 0, 0);
	draw_sprite(spr_pauseconfecti2, global.chocofollow, 0, 0);
	draw_sprite(spr_pauseconfecti3, global.crackfollow, 0, 0);
	draw_sprite(spr_pauseconfecti4, global.wormfollow, 0, 0);
	draw_sprite(spr_pauseconfecti5, global.candyfollow, 0, 0);
	

	pal_swap_set(spr_pal, pal, 0);
	draw_sprite(spr_pizzelle_pause, global.panic, 686, 285);
	shader_reset();
	draw_set_font(global.font);
	draw_set_color(c_white);
	var _x = 86;
	var _y = 32;
	if (global.playseconds > 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":" + string(global.playseconds)));
	if (global.playseconds < 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":0" + string(global.playseconds)));
	var spacing = 0;
	var spacing_x = 0;
	draw_set_halign(fa_left);

	for (var i = 0; i < array_length(options); i++;)
	{
		var _struct = options[i];
		draw_sprite(spr_pausebutton, _struct.is_selected, _struct.x + spacing_x, 30 + spacing);
		draw_text(options[i].x + 40 + spacing_x, 65 + spacing, _struct.name);
		spacing += 120;
		spacing_x -= 40;
	}
}