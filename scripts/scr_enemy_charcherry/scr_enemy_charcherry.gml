function scr_enemy_charcherry()
{
	var targetplayer = obj_player;
	var playerposition = x - targetplayer.x;
	if (x != targetplayer.x && image_xscale != -sign(playerposition))
	{
		movespeed = 10;
		image_xscale = -sign(playerposition);
		slide = -image_xscale * (movespeed + 4);
	}
	if (slide <= 0)
		slide += 0.2;
	else if (slide > 0)
		slide -= 0.2;
	hsp = (image_xscale * movespeed) + slide;
	if (grounded && scr_solid(x + image_xscale, y))
		vsp -= 8;
}
