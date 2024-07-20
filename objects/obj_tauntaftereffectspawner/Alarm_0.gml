with (instance_create(x, y, obj_tauntafterimage))
{
	hsp = 20;
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
}
with (instance_create(x, y, obj_tauntafterimage))
{
	hsp = -20;
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
}
with (instance_create(x, y, obj_tauntafterimage))
{
	vsp = 20;
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
}
with (instance_create(x, y, obj_tauntafterimage))
{
	vsp = -20;
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
}
with (instance_create(x, y, obj_tauntafterimage))
{
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
	hsp = 20;
	vsp = 20;
}
with (instance_create(x, y, obj_tauntafterimage))
{
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
	hsp = 20;
	vsp = -20;
}
with (instance_create(x, y, obj_tauntafterimage))
{
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
	hsp = -20;
	vsp = 20;
}
with (instance_create(x, y, obj_tauntafterimage))
{
	playerid = other.playerid;
	storedimage = other.playerid.image_index;
	hsp = -20;
	vsp = -20;
}
instance_destroy();
