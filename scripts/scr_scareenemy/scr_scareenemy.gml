function scr_scareenemy()
{
	if (point_in_rectangle(x, y, obj_player.x - 400, obj_player.y - 60, obj_player.x + 400, obj_player.y + 60) && (obj_player.state == states.mach3 || obj_player.state == states.machpizzano || (obj_player.movespeed >= 10 && obj_player.state == states.minecart)))
	{
		if (state != baddiestates.scared)
		{
			state = baddiestates.scared;
			sprite_index = scaredspr;
			if (x != obj_player.x)
				image_xscale = -sign(x - obj_player.x);
			hsp = 0;
			if (grav != 0 && grounded)
				vsp = -3;
			image_index = 0;
		}
		ScareBuffer = clamp(ScareBuffer++, 50, 80);
	}
	ScareBuffer--;
	if (ScareBuffer <= 0 && state == baddiestates.scared)
	{
		state = baddiestates.walk;
		sprite_index = walkspr;
		ScareBuffer = 0;
	}
}
