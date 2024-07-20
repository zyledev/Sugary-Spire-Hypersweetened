scr_getinput();
if (!pause && !instance_exists(obj_fadeout))
{
	if (!global.shellactivate && key_start2 && room != rank_room && room != realtitlescreen && canmove)
	{
		selected = 0;
		if (!instance_exists(obj_pausefadeout))
			instance_create(x, y, obj_pausefadeout);
	}
}
if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
	instance_destroy(obj_pausefadeout);
if (pause)
{
	if (canmove)
	{
		scr_getinput();
		if (key_down2 && selected < 3)
		{
			selected += 1;
			scr_sound(sound_land);
		}
		if (key_up2 && selected > 0)
		{
			selected -= 1;
			scr_sound(sound_land);
		}
		if (key_jump)
		{
			switch (selected)
			{
				case 0:
					if (!instance_exists(obj_pausefadeout))
						instance_create(x, y, obj_pausefadeout);
					break;
				case 1:
					event_user(1);
					break;
				case 2:
					event_user(2);
					break;
				case 3:
					event_user(3);
					break;
			}
		}
	}
}
if (!pause)
	pal = obj_player.paletteselect;
