draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_font(global.creditsfont);
max_height = _y < string_height(credits_text) + 100
draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT + 50 - _y, string_upper(credits_text));