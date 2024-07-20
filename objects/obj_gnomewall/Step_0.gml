if (place_meeting(x + 1, y, obj_charcherry) || place_meeting(x - 1, y, obj_charcherry))
{
	instance_destroy();
	instance_destroy(obj_charcherry);
}
