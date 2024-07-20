playerid = obj_player;
image_speed = 0;
image_alpha = 1;
sprite_index = obj_player.sprite_index;
randomize();
color = choose(1, 2);
realcol = 
{
	r: 0,
	g: 0,
	b: 0,
	r2: 0,
	g2: 0,
	b2: 0
};
blink_time = 3;
alarm[1] = blink_time;
alarm[0] = 13;
gonealpha = 0.85;
vanish = 0;
spr_palette = spr_afterimagepal;
draw_angle = obj_player.draw_angle;
