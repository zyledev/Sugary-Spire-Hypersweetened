if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(1))
{
	if (obj_user.message == "PLAYTESTER20212012" && obj_pass.message == "5690T3ST01258")
	{
		with (obj_player)
		{
			targetDoor = "A";
			targetRoom = hub_room1;
		}
		if (!instance_exists(obj_fadeout))
		{
			scr_sound(sound_pizzagot);
			instance_create(x, y, obj_fadeout);
		}
		global.login = true;
	}
	else
	{
		scr_sound(sound_losetransformation);
		with (obj_tv)
		{
			message = "USER AND PASSWORD INCORRECT!";
			showtext = true;
			alarm[0] = 200;
		}
	}
}
if (position_meeting(mouse_x, mouse_y, id) && instance_exists(obj_fadeout))
	global.login = true;
