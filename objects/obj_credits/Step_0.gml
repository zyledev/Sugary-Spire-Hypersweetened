if (y <= -1700)
	can_goUp = false;
if (obj_player.key_jump2 && !instance_exists(obj_fadeout))
{
	scr_playerreset();
	obj_player.targetDoor = "A";
	obj_player.targetRoom = hub_room1;
	audio_stop_all();
	instance_create(x, y, obj_fadeout);
}
if (can_goUp)
	vspeed = lerp(vspeed, -1, 0.1);
else
	vspeed = lerp(vspeed, 0, 0.2);
