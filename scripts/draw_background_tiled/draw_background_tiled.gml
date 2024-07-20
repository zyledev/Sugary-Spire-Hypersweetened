function draw_background_tiled(_sprite, _x, _y)
{
	if (!global.panic)
		draw_sprite_tiled(_sprite, 0, _x, _y);
	if (global.panic)
	{
	}
}
