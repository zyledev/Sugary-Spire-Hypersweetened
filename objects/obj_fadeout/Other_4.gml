if (room == outer_room1 && obj_player.state == states.titlescreen)
{
	obj_player.vsp = 5;
	obj_player.xscale = 1;
	obj_player.movespeed = 11;
	obj_player.state = states.backbreaker;
	obj_player.sprite_index = spr_player_machfreefall;
}
