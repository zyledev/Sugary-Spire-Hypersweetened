if (global.panic)
{
	if (global.seconds == 0 && global.minutes == 0)
	{
		if (global.collect > 0)
		{
			global.collect -= 5;
			with (instance_create(obj_player.x, obj_player.y, obj_pizzaloss))
				sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
		}
	}
}
alarm[2] = 3;
