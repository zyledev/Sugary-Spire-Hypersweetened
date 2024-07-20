function cutscene_create(_scene)
{
	global.cutsceneManager = instance_create(0, 0, obj_cutsceneManager);
	with (global.cutsceneManager)
	{
		Event = _scene[0];
		for (var i = 1; i < array_length(_scene); i++)
			ds_queue_enqueue(Cutscene, _scene[i]);
	}
}
function cutscene_event_end()
{
	if (!ds_queue_empty(Cutscene))
		Event = ds_queue_dequeue(Cutscene);
	else
		instance_destroy();
}
function cutscene_declare_actor(_actor, _scene)
{
	with (global.cutsceneManager)
	{
		if (ds_exists(ActorMap, 1))
			ds_map_set(ActorMap, _scene, _actor);
	}
	return true;
}
function cutscene_get_actor(_actor)
{
	return ds_map_find_value(ActorMap, _actor);
}
