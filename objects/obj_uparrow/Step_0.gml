image_speed = 0.2;
with (obj_player)
{
	if ((!place_meeting(x, y, obj_door) && (!place_meeting(x, y, obj_startgate) || state == states.victory) && !place_meeting(x, y, obj_keydoorclock) && !place_meeting(x, y, obj_keydoor) && !place_meeting(x, y, obj_exitgate)) || !grounded || state != states.normal)
		instance_destroy(other.id);
}
x = obj_player.x;
y = obj_player.y - 50;
