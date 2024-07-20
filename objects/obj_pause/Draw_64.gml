if (pause)
{
	draw_sprite_tiled(bg_paused, 0, x++, y++);
	draw_rectangle_color(-5000, 0, 0, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_rectangle_color(960, 0, 5960, 1080, 2752517, 2752517, 2752517, 2752517, false);
	draw_sprite(spr_pause, selected, 0, 0);
	if (global.mallowfollow)
		draw_sprite(spr_pauseconfecti1, 1, 0, 0);
	else
		draw_sprite(spr_pauseconfecti1, 0, 0, 0);
	if (global.chocofollow)
		draw_sprite(spr_pauseconfecti2, 1, 0, 0);
	else
		draw_sprite(spr_pauseconfecti2, 0, 0, 0);
	if (global.crackfollow)
		draw_sprite(spr_pauseconfecti3, 1, 0, 0);
	else
		draw_sprite(spr_pauseconfecti3, 0, 0, 0);
	if (global.wormfollow)
		draw_sprite(spr_pauseconfecti4, 1, 0, 0);
	else
		draw_sprite(spr_pauseconfecti4, 0, 0, 0);
	if (global.candyfollow)
		draw_sprite(spr_pauseconfecti5, 1, 0, 0);
	else
		draw_sprite(spr_pauseconfecti5, 0, 0, 0);
	pal_swap_set(spr_pal, pal, 0);
	draw_sprite(spr_pizzelle_pause, global.panic, 686, 285);
	shader_reset();
	draw_set_font(global.font);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	var _x = 86;
	var _y = 32;
	if (global.playseconds > 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":" + string(global.playseconds)));
	if (global.playseconds < 10)
		draw_text(_x, _y, string_hash_to_newline(string(global.playminutes) + ":0" + string(global.playseconds)));
}
