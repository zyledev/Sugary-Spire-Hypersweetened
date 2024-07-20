function scr_queue_tvanim(_spr = undefined, _length = 150)
{
	ds_queue_enqueue(global.newhudtvanim, _spr);
	ds_queue_enqueue(global.newhudtvanim, _length);
}
function scr_forceplay_tvanim(_spr = undefined, _length = 150)
{
	obj_tv.tvsprite = ds_queue_dequeue(_spr);
	obj_tv.tvlength = ds_queue_dequeue(_length);
	ds_queue_clear(global.newhudtvanim);
}
