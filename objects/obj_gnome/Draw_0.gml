draw_self();
if (sprite_index == spr_gnomechompski && instance_exists(wall))
	draw_sprite(spr_donutbubble, don, x, y - 35);
if (sprite_index == spr_gnomechompskiblowup)
	draw_sprite_ext(spr_gnomechompskiblowup_Dynamite, -1, x, y, -image_xscale, image_yscale, 0, c_white, 1);
