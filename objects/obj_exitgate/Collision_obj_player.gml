if (global.panic)
{
	with (obj_player)
	{
		if (grounded && input.key_up.check && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3))
		{
			targetDoor = "none";
			if (global.collect >= global.srank)
				global.rank = "s";
			else if (global.collect > global.arank)
				global.rank = "a";
			else if (global.collect > global.brank)
				global.rank = "b";
			else if (global.collect > global.crank)
				global.rank = "c";
			else
				global.rank = "d";
			if (global.rank == "s")
				scr_sound(mu_ranks);
			if (global.rank == "a")
				scr_sound(mu_ranka);
			if (global.rank == "b")
				scr_sound(mu_rankb);
			if (global.rank == "c")
				scr_sound(mu_rankc);
			if (global.rank == "d")
				scr_sound(mu_rankd);
			if (global.rank == "e")
				scr_sound(mu_rankd);
			audio_stop_sound(mu_escape);
			ini_open("saveData.ini");
			if (room == mines_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "mines", "none")))
					ini_write_string("Ranks", "mines", global.rank);
			}
			if (room == molasses_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "molasses", "none")))
					ini_write_string("Ranks", "molasses", global.rank);
			}
			if (room == steamy_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "steamy", "none")))
					ini_write_string("Ranks", "steamy", global.rank);
			}
			if (room == entryway_1)
			{
				if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", "entryway", "none")))
					ini_write_string("Ranks", "entryway", global.rank);
			}
			ini_close();
			obj_tv.tvsprite = spr_tvoff;
			if (!instance_exists(obj_endlevelfade))
			{
				instance_create(x, y, obj_endlevelfade);
				if (state != states.door)
				{
					sprite_index = spr_lookdoor;
					state = states.door;
					obj_endlevelfade.alarm[0] = 235;
					image_index = 0;
				}
			}
			global.panic = false;
		}
	}
}
