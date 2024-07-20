function layer_tilemap_get_id_fixed(_layer)
{
	if (layer_exists(_layer))
	{
		var els = layer_get_all_elements(_layer);
		var n = array_length(els);
		for (var i = 0; i < n; i++)
		{
			var el = els[i];
			if (layer_get_element_type(el) == 5)
				return el;
		}
	}
	return -1;
}
function layer_background_get_id_fixed(_layer)
{
	if (layer_exists(_layer))
	{
		var els = layer_get_all_elements(_layer);
		var n = array_length(els);
		for (var i = 0; i < n; i++)
		{
			var el = els[i];
			if (layer_get_element_type(el) == 1)
				return el;
		}
		return -1;
	}
	return -1;
}
function layer_change_background(_layer, _sprite)
{
	if (_layer != _sprite)
	{
		var a = layer_get_all();
		for (var i = 0; i < array_length(a); i++)
		{
			var back_id = layer_background_get_id_fixed(a[i]);
			if (layer_background_get_sprite(back_id) == _layer)
				layer_background_sprite(back_id, _sprite);
		}
	}
}
function get_all_layer_type(_type = 0)
{
	var layers;
	var layernum = 0;
	var a = layer_get_all();
	for (var i = 0; i < array_length(a); i++)
	{
		var els = layer_get_all_elements(a[i]);
		if (layer_get_element_type(els) == _type)
			layers[layernum++] = a[i];
	}
	if (!layernum)
		return -4;
	return layers;
}
