function parallax_layer(_lay = undefined)
{
	var return_value;
	return_value[0] = 0;
	return_value[1] = 0;
	if (_lay != -4)
	{
		var _layer = ds_map_find_value(global.ParallaxMap, layer_get_name(_lay));
		if (!is_undefined(_layer))
		{
			var _function = ds_map_find_value(global.ParallaxMap, layer_get_name(_lay));
			return _function();
		}
	}
	return return_value;
}
function add_parallax_function(_layer, _func, _bool = false)
{
	if (_bool || (_func == 0 && is_undefined(ds_map_find_value(global.ParallaxMap, layer_get_name(_layer)))))
		ds_map_set(global.ParallaxMap, _layer, _func);
	return true;
}
