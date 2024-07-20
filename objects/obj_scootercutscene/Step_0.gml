if (hit)
	scr_collide();
if (sprite_index == spr_file3 && !instance_exists(obj_superdashcloud))
	instance_create(x - 100, y, obj_superdashcloud);
if (x >= 960 && !instance_exists(obj_fadeout))
{
	with (instance_create(x, y, obj_fadeout))
		obj_player.targetRoom = outer_room1;
}
