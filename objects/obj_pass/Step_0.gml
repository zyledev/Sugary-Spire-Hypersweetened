if (position_meeting(mouse_x, mouse_y, id))
	message = keyboard_string;
if (message == "PASS" && keyboard_check(vk_down))
	scr_sound(sound_youfuckindick);
if (position_meeting(mouse_x, mouse_y, id))
	selected = 1;
else
	selected = 0;
if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(1))
	message = " ";
