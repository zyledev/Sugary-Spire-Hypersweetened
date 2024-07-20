scr_collide();
if (place_meeting(x, y - 4, obj_player) && obj_player.state != states.minecart)
{
	obj_player.state = states.minecart;
	if (obj_player.xscale == image_xscale)
		obj_player.movespeed = clamp(obj_player.movespeed, 3, 12);
	else
		obj_player.movespeed = clamp(obj_player.movespeed / 2, 3, 12);
	obj_player.sprite_index = spr_player_minecart;
	obj_player.y = other.y;
	obj_player.xscale = image_xscale;
	if (!instance_exists(obj_poofeffect))
		instance_create(x, y, obj_poofeffect);
}
if (obj_player.state == states.minecart)
	image_alpha = 0.5;
else
	image_alpha = 1;
