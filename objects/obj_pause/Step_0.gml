input_check(input);
if (!pause && !instance_exists(obj_fadeout))
{
	if (!global.shellactivate && input.key_pause.pressed && room != rank_room && room != realtitlescreen && canmove)
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
		
		if (input.key_down.pressed && selected < 3)
		{
			selected += 1;
			scr_sound(sound_land);
		}
		if (input.key_up.pressed && selected > 0)
		{
			selected -= 1;
			scr_sound(sound_land);
		}
		if (input.key_confirm.pressed)
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
