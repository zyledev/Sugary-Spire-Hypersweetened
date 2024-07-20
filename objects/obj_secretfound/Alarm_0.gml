with (obj_tv)
{
	message = "YOU HAVE FOUND A SECRET!";
	showtext = true;
	alarm[0] = 150;
}
scr_sound(sound_secretgot);
instance_destroy();
