function scr_confecti_normal()
{
	image_alpha = obj_player.image_alpha;
	if (sprite_index != spr_appear)
	{
		if (obj_player.hsp != 0)
			sprite_index = spr_run;
		else if (!global.panic)
			sprite_index = spr_idle;
		else
			sprite_index = spr_panic;
	}
	var dist2 = 0;
	if (obj_player.grounded)
		dist2 = -32 * image_xscale;
	else
		dist2 = 0;
	distance = lerp(distance, dist2, 0.1);
	var _leader = -4;
	_leader = !ds_list_find_index(global.FollowerList, id) ? obj_player : ds_list_find_value(global.FollowerList, floor(ds_list_find_index(global.FollowerList, id) - 1));
	if (instance_exists(_leader))
	{
		ds_queue_enqueue(followQueue, _leader.x);
		ds_queue_enqueue(followQueue, _leader.y);
	}
	LAG_STEPS = 10;
	if (ds_queue_size(followQueue) > (LAG_STEPS * 2))
	{
		targetx = ds_queue_dequeue(followQueue) + distance;
		targety = ds_queue_dequeue(followQueue);
	}
	image_xscale = obj_player.xscale;
	x = targetx;
	y = targety;
	if (obj_player.state == states.backbreaker && obj_player.sprite_index == spr_pizzelle_taunt && state != confectistates.taunt)
	{
		instance_create(x, y, obj_confectitaunt);
		state = confectistates.taunt;
	}
}
