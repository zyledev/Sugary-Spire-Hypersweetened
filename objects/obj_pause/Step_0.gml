input_check(input);
if (!global.pause && !instance_exists(obj_fadeout))
{
	if (!global.shellactivate && input.key_pause.pressed && room != realtitlescreen && canmove)
	{
		selected = 0;
		options[0].is_selected = true;
		event_user(0);
	}
}

if (instance_exists(obj_pausefadeout) && instance_exists(obj_fadeout))
	instance_destroy(obj_pausefadeout);
if (global.pause && canmove)
{
	if (!audio_is_playing(mu_pause))
		scr_soundloop(mu_pause);
	var move = input.key_down.pressed + -input.key_up.pressed
	if (move != 0)
	{
		scr_sound(sound_land);
		selected += move;
		selected = clamp(selected, 0, array_length(options)-1);
	}
	options[selected].is_selected = true;
	if (input.key_jump.pressed)
		options[selected].callback();
}
if (instance_exists(obj_player))
	pal = obj_player.paletteselect;

for (var l = 0; l < array_length(options); l++;)
{
	if (global.pause)
	{
		if (selected == l)
			options[l].x = lerp(options[l].x, 200, 0.1);
		else
			options[l].x = lerp(options[l].x, 180, 0.1);
		// reset the selection frame
		options[l].is_selected = (selected == l)
	}
	else
	{
		options[l].x = 0;
	}

}