var lay_id = layer_get_id("Backgrounds_foreground");
layer_depth(lay_id, -15);
layerNum = 0;
var a = layer_get_all();
for (var i = 0; i < array_length(a); i++)
{
	var back_id = layer_background_get_id_fixed(layer_get_name(a[i]));
	if (back_id != -1 && !layer_get_depth(a[i]) <= 0 && layer_get_visible(a[i]))
		layers[layerNum++] = 
		{
			layer_id: a[i],
			layer_image_speed: layer_background_get_speed(back_id),
			layer_xoffset: layer_get_x(a[i]),
			layer_yoffset: layer_get_y(a[i]),
			layer_xspeed: layer_get_hspeed(a[i]),
			layer_yspeed: layer_get_vspeed(a[i]),
			layer_xshift: global.ScrollOffset * layer_get_hspeed(a[i]),
			layer_yshift: global.ScrollOffset * layer_get_vspeed(a[i])
		};
	else
		layers[layerNum++] = undefined;
}
var filt_id = layer_get_id("Effect_1");
layer_depth(filt_id, -200);
scr_parallaxbg_init();
