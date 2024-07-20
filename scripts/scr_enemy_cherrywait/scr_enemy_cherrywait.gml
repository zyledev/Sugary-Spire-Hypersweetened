function scr_enemy_cherrywait()
{
	image_speed = 0.35;
	vsp = 20;
	if (!global.panic)
		sprite_index = spr_charcherry_wait;
	else if (global.panic && grounded && sprite_index != spr_charcherry_popout && ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 60) && y >= (obj_player.y - 60))))
	{
		image_index = 0;
		sprite_index = spr_charcherry_popout;
	}
	if (sprite_index == spr_charcherry_popout && animation_end())
	{
		state = baddiestates.charcherry;
		sprite_index = spr_charcherry_run;
		movespeed = 8;
		vsp = 0;
	}
}
