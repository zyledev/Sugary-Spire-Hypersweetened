if ((place_meeting(x, y - obj_player.vsp, obj_player) || place_meeting(x, y - 1, obj_player)) && obj_player.state == states.freefallland && obj_player.sprite_index == spr_player_bodyslamland)
{
	if (!instance_exists(SpoutID))
	{
		with (instance_create(x, y, obj_geyservertical))
		{
			scr_sound(sfx_geyser);
			image_xscale = other.image_xscale;
			geysertimer = 300;
			other.SpoutID = id;
		}
	}
}
Imageindex += 0.35;
