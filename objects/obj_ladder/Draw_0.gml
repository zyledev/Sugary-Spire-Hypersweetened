for (var i = 0; i < (image_yscale - 1); i++)
	draw_sprite_ext(spr_ladder, 0, x, y + (i * 32), image_xscale, 1, 0, c_white, 1);
var end_ladder = !place_meeting(x, y + 1, obj_ladder) ? spr_ladderend : spr_ladder;
draw_sprite_ext(end_ladder, 0, x, y + ((image_yscale - 1) * 32), image_xscale, 1, 0, c_white, 1);
