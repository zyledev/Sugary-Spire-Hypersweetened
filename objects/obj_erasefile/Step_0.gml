input_check(input);
if ((input.key_left.pressed || keyboard_check_pressed(vk_left)) && optionselected > 0)
{
	optionselected -= 1;
	scr_sound(sound_step);
}
if ((input.key_right.pressed || keyboard_check_pressed(vk_right)) && optionselected < 1)
{
	optionselected += 1;
	scr_sound(sound_step);
}
if (optionselected && (input.key_confirm.pressed || keyboard_check_pressed(vk_enter)))
{
	file_delete("saveData.ini");
	scr_sound(sound_destroyblock1);
	scr_sound(sound_explosion);
	instance_destroy();
}
if (input.key_back.pressed || keyboard_check_pressed(vk_escape) || (!optionselected && (input.key_confirm.pressed || keyboard_check_pressed(vk_enter))))
{
	scr_sound(sound_enemythrow);
	instance_destroy();
}
