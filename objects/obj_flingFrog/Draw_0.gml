if (grabbedPlayer != -4)
{
	var xx = xstart;
	var yy = ystart;
	if (farBuffer >= 10)
	{
		xx += (random_range(-farBuffer, farBuffer) / 50);
		yy += (random_range(-farBuffer, farBuffer) / 50);
		draw_sprite(spr_flingfrogmadTire, -1, xx, yy);
	}
	draw_sprite_ext(spr_flingfrogmad, -1, xx, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
	draw_sprite(spr_flingFrog, -1, xstart, ystart);
if (grabbedPlayer != -4)
	draw_sprite(spr_flingfrog_handsmove, -1, x, y);
else
{
	draw_sprite(spr_flingFrogGrab, candyindex, x, y);
	draw_sprite(spr_flingfrog_handsidle, -1, x, y);
}
if (global.debugmode)
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
