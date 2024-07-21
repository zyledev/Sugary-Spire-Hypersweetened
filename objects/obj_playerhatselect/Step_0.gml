if (image_index != Selection)
{
	image_index = Selection;
	alarm[0] = 60;
	fadeout = false;
}
if (obj_player.input.key_jump.check && obj_playerhat.image_index != Selection)
{
	if (HatIndex[Selection] == 1)
	{
		scr_sound(sound_enemythrow);
		instance_create(x, y, obj_poofeffect);
		obj_playerhat.image_index = Selection;
	}
	else
		scr_sound(sound_step);
}
if (fadeout && image_index == 0)
	image_alpha = clamp(image_alpha - 0.05, 0, 1);
else
	image_alpha = 1;
y = ystart + wave(5, -5, 1, 0);
