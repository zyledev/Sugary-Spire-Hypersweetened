if (sprite_index == spr_file1confirm && !instance_exists(obj_fadeout))
{
	obj_player.targetRoom = scootercutsceneidk;
	obj_player.targetDoor = "A";
	instance_create(x, y, obj_fadeout);
}
