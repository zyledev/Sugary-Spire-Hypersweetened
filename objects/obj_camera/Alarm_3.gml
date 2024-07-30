if (room != hub_room1 && room != palroom && room != rank_room)
{
	global.playseconds += 1;
	if (!global.pause)
	{
		if (global.playseconds > 59)
		{
			global.playminutes += 1;
			global.playseconds -= 59;
		}
	}
}
alarm[3] = 60;
