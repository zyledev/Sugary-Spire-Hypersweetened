if (pos_x == "POO")
	pos_x = other.x;
with (other.id)
{
	global.combofreeze = 30;
	x = other.pos_x;
	y = other.y + ((other.sprite_height / 2) * sign(other.image_yscale));
	var _x1 = clamp(x, other.x + 13, (other.x + other.sprite_width) - 13);
	var xpos_difference = point_distance(_x1, 0, other.x, 0);
	var xpos = xpos_difference / other.image_xscale;
	var xpos_offset = xpos * other.hallwayxscale;
	targetDoor = other.targetDoor;
	targetRoom = other.targetRoom;
	vertical = true;
	verticaloffset = xpos_offset;
	hallwaydirection = sign(other.image_yscale);
	if (!instance_exists(obj_fadeout))
	{
		scr_sound(sound_door);
		instance_create(x, y, obj_fadeout);
	}
}
