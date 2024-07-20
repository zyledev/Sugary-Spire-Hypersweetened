if ((obj_player.x > (x - 200) && obj_player.x < (x + 200)) && (y <= (obj_player.y + 200) && y >= (obj_player.y - 200)))
{
	if (timer != -2)
		timer -= 0.1;
	if (timer == -2 && obj_player.state == states.backbreaker)
		timer = 20;
	if (timer == -2 && obj_player.state != states.backbreaker)
	{
		with (obj_player)
			scr_hurtplayer();
		if (obj_player.state != states.hurt)
			timer = 20;
	}
}
