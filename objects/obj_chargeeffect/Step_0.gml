image_xscale = obj_player.xscale;
if (obj_player.state != states.mach3 && obj_player.state != states.minecart)
	instance_destroy();
if (obj_player.state != states.minecart)
	x = obj_player.x;
else if (obj_player.state == states.minecart)
	x = obj_player.x + (32 * obj_player.xscale);
y = obj_player.y;
depth = obj_player.depth - 6;
if (obj_player.state == states.machroll || obj_player.sprite_index == spr_player_dive || (obj_player.state == states.minecart && obj_player.movespeed < 12))
	instance_destroy();
