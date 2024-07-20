if (place_meeting(x, y + 1, obj_player) || place_meeting(x, y - 1, obj_player) || place_meeting(x - 1, y, obj_player) || place_meeting(x + 1, y, obj_player))
{
	if (obj_player.state == states.bombpep && (place_meeting(x + 1, y, obj_player) || place_meeting(x - 1, y, obj_player)))
	{
		with (obj_player)
		{
			sprite_index = spr_bombpep_runabouttoexplode;
			bombpeptimer = 0;
		}
	}
}
