if (!audio_is_playing(sound_parry))
	scr_sound(sound_parry);
with (obj_baddie)
{
	if (distance_to_object(other.id) < 64 && (object_index != obj_charcherry || (object_index == obj_charcherry && state == baddiestates.charcherry)))
		instance_destroy();
}
with (obj_player)
{
	state = states.parry;
	sprite_index = choose(spr_player_parry1, spr_player_parry2, spr_player_parry3);
	image_index = 0;
	movespeed = -8;
	flash = true;
}
