if (place_meeting(x, y + 1, obj_player) && obj_player.sprite_index == spr_player_bodyslamfall)
	instance_destroy();
global.switchactivated = true;
