var _show_frame = (!global.pause)
gameframe_can_input = _show_frame;

var _target_alpha;
if (_show_frame) _target_alpha = 1; else _target_alpha = 0; // or ?:
gameframe_alpha = lerp(gameframe_alpha, _target_alpha, 0.1);

gameframe_caption_icon = spr_gameframe_icon;
gameframe_update();

// fullscreen
if (gameframe_get_fullscreen() != global.fullscreen * 2)
{
	gameframe_set_fullscreen(global.fullscreen * 2);
	//surface_resize(application_surface, 960, 540);
    //__display_set_gui_size_hook(960, 540);
}	
// window size
if (!global.fullscreen)
{
	switch (global.selectedResolution)
	{
		case 0:
			if window_get_width() != 480
				window_set_size(480, 260);
			break;
		case 1:
			if window_get_width() != 960
				window_set_size(960, 540);
			break;
		case 2:
			if window_get_width() != 1280
				window_set_size(1280, 720);
			break;
	}
}