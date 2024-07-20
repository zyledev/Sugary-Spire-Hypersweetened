if (place_meeting(x + 1, y, obj_geyserdestroyable))
{
	with (instance_place(x + 1, y, obj_geyserdestroyable))
		alarm[0] = 9;
}
if (place_meeting(x - 1, y, obj_geyserdestroyable))
{
	with (instance_place(x - 1, y, obj_geyserdestroyable))
		alarm[0] = 9;
}
if (place_meeting(x, y + 1, obj_geyserdestroyable))
{
	with (instance_place(x, y + 1, obj_geyserdestroyable))
		alarm[0] = 9;
}
if (place_meeting(x, y - 1, obj_geyserdestroyable))
{
	with (instance_place(x, y - 1, obj_geyserdestroyable))
		alarm[0] = 9;
}
instance_destroy();
