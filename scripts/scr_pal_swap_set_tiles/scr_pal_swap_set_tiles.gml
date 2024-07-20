function scr_pal_swap_set_tiles()
{
	var _pal_sprite = argument[0];
	var _pal_index = argument[1];
	var _low = argument[2] + 1;
	var _high = argument[3] - 1;
	var _is_surface = argument[4];
	if (_low < _high)
	{
		_low = argument[3] - 1;
		_high = argument[2] + 1;
	}
	var _start_exists = 0;
	with (obj_tile_swapper_start)
	{
		if (depth == _low)
		{
			_start_exists = true;
			active = true;
			pal_sprite = _pal_sprite;
			pal_index = _pal_index;
			pal_is_surface = _is_surface;
		}
	}
	if (!_start_exists)
	{
		with (instance_create(0, 0, obj_tile_swapper_start))
		{
			active = true;
			depth = _low;
			pal_sprite = _pal_sprite;
			pal_index = _pal_index;
			pal_is_surface = _is_surface;
		}
	}
	var _end_exists = false;
	with (obj_tile_swapper_end)
	{
		if (depth == _high)
		{
			_end_exists = true;
			active = true;
		}
	}
	if (!_end_exists)
	{
		with (instance_create(0, 0, obj_tile_swapper_end))
		{
			active = true;
			depth = _high;
		}
	}
}
