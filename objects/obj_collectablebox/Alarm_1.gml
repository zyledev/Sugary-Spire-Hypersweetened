alarm[0] = 1;
if (place_meeting(x + 1, y, obj_collectablebox))
{
	with (instance_place(x + 1, y, obj_collectablebox))
		alarm[1] = 9;
}
if (place_meeting(x - 1, y, obj_collectablebox))
{
	with (instance_place(x - 1, y, obj_collectablebox))
		alarm[1] = 9;
}
if (place_meeting(x, y + 1, obj_collectablebox))
{
	with (instance_place(x, y + 1, obj_collectablebox))
		alarm[1] = 9;
}
if (place_meeting(x, y - 1, obj_collectablebox))
{
	with (instance_place(x, y - 1, obj_collectablebox))
		alarm[1] = 9;
}
