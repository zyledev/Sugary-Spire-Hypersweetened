if (ds_list_find_index(global.saveroom, id) == -1)
{
	var rep = 7 + ((sprite_width / 32) - 1);
	repeat (rep)
	{
		with (instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_debris))
			sprite_index = spr_bigdebris;
	}
	if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
	{
		audio_stop_sound(sound_destroyblock1);
		audio_stop_sound(sound_destroyblock2);
	}
	scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
	ds_list_add(global.saveroom, id);
}
var lay_id = layer_get_id(layer_tile);
var map_id = layer_tilemap_get_id(lay_id);
for (var i = 0; i < floor(sprite_width / tilemap_get_tile_width(map_id)); i++)
{
	for (var z = 0; z < floor(sprite_height / tilemap_get_tile_height(map_id)); z++)
	{
		var data = tilemap_get_at_pixel(map_id, x + (i * tilemap_get_tile_width(map_id)) + 1, y + (z * tilemap_get_tile_height(map_id)) + 1);
		data = tile_set_empty(data);
		tilemap_set_at_pixel(map_id, data, x + (i * tilemap_get_tile_width(map_id)) + 1, y + (z * tilemap_get_tile_height(map_id)) + 1);
	}
}
