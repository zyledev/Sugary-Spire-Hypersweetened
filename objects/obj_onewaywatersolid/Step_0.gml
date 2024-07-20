if (obj_player.state != states.mach2 && obj_player.state != states.mach3 && obj_player.state != states.minecart)
{
	instance_destroy();
	if (instance_exists(obj_watertop))
		obj_watertop.created = false;
	if (instance_exists(obj_minecartRail))
		obj_minecartRail.created = false;
}
