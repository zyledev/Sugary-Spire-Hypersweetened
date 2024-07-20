draw_self();
draw_text(x, y, timer);
if ((obj_player.x > (x - 200) && obj_player.x < (x + 200)) && (y <= (obj_player.y + 200) && y >= (obj_player.y - 200)))
{
	if (timer >= 0)
		draw_triangle(obj_taunttimer.x + 10, obj_taunttimer.y + 70, obj_taunttimer.x + 68, obj_taunttimer.y + 70, obj_player.x, obj_player.y, 1);
	if (timer < 0)
	{
		draw_set_color(c_red);
		draw_triangle(obj_taunttimer.x + 10, obj_taunttimer.y + 70, obj_taunttimer.x + 68, obj_taunttimer.y + 70, obj_player.x, obj_player.y, 1);
	}
}
