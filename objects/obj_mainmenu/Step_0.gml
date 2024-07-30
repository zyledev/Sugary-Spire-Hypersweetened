if (can_move)
{
	input_check(input);
	// self explanatory
	var move = -input.key_up.pressed + input.key_down.pressed;
	if (move != 0)
	{
		selected += move;
		selected = clamp(selected, 0, array_length(menu_array)-1)
		scr_sound(sound_step, sound_step2);
	}
	
	if (input.key_jump.pressed)
	{
		// if its the play button script then do play button stuff
		if (menu_array[selected][1] == mainmenu_playbutton)
		{
			pizzy_sprite = spr_file1confirmNEW;
			scr_sound(sound_toppingot);
		}
		script_execute(menu_array[selected][1]);
	}
}