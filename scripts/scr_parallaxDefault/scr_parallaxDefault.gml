function scr_default_parallax(_bool = false)
{
	bg = undefined;
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.25;
		array[1] = _camera.centeredcam_y * 0.25;
		return array;
	};
	add_parallax_function("Backgrounds_1", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.15;
		array[1] = _camera.centeredcam_y * 0.15;
		return array;
	};
	add_parallax_function("Backgrounds_2", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.05;
		array[1] = _camera.centeredcam_y * 0.05;
		return array;
	};
	add_parallax_function("Backgrounds_3", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.005;
		array[1] = _camera.centeredcam_y * 0.005;
		return array;
	};
	add_parallax_function("Backgrounds_4", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_5"));
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.0005;
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.0005 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_5", bg, _bool);
	bg = function()
	{
		var foregroundoffsety = room_height - sprite_get_height(layer_background_get_sprite(back_id));
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_foregroundLow"));
		var array = -4;
		array[0] = _camera.centeredcam_x * 1.5;
		array[1] = clamp(((_camera.centeredcam_y * 0.9) + camera_get_view_height(view_camera[0])) - sprite_get_height(layer_background_get_sprite(back_id)), foregroundoffsety, foregroundoffsety + 8);
		return array;
	};
	add_parallax_function("Backgrounds_foregroundLow", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.centeredcam_x * 1.5;
		array[1] = _camera.centeredcam_x * 1.5;
		return array;
	};
	add_parallax_function("Backgrounds_foreground", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		var lay_y = 0;
		if (instance_exists(obj_parallax))
		{
			for (var i = 0; i < array_length(obj_parallax.layers); i++)
			{
				if (obj_parallax.layers[i] != undefined)
				{
					with (obj_parallax.layers[i])
					{
						if (layer_get_name(layer_id) == "Backgrounds_long1")
							lay_y = layer_yoffset;
					}
				}
			}
		}
		array[0] = _camera.centeredcam_x * 0.25;
		array[1] = clamp((_camera.centeredcam_y * 0.15) + lay_y, lay_y - 192, lay_y + 32) - lay_y;
		return array;
	};
	add_parallax_function("Backgrounds_long1", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		var lay_y = 0;
		if (instance_exists(obj_parallax))
		{
			for (var i = 0; i < array_length(obj_parallax.layers); i++)
			{
				if (obj_parallax.layers[i] != undefined)
				{
					with (obj_parallax.layers[i])
					{
						if (layer_get_name(layer_id) == "Backgrounds_long2")
							lay_y = layer_yoffset;
					}
				}
			}
		}
		array[0] = _camera.centeredcam_x * 0.15;
		array[1] = clamp((_camera.centeredcam_y * 0.15) + lay_y, lay_y - 192, lay_y + 32) - lay_y;
		return array;
	};
	add_parallax_function("Backgrounds_long2", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_Ground1"));
		var array = -4;
		var _height = room_height - sprite_get_height(layer_background_get_sprite(back_id));
		array[0] = _camera.centeredcam_x * 0.25;
		array[1] = clamp(((_camera.cam_y * 0.25) + camera_get_view_height(view_camera[0])) - sprite_get_height(layer_background_get_sprite(back_id)), _height, _height + 8);
		return array;
	};
	add_parallax_function("Backgrounds_Ground1", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_Ground2"));
		var array = -4;
		var _height = room_height - sprite_get_height(layer_background_get_sprite(back_id));
		array[0] = _camera.centeredcam_x * 0.15;
		array[1] = clamp(((_camera.cam_y * 0.15) + camera_get_view_height(view_camera[0])) - sprite_get_height(layer_background_get_sprite(back_id)), _height, _height + 8);
		return array;
	};
	add_parallax_function("Backgrounds_Ground2", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H1"));
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.25;
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.25 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_H1", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H2"));
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.15;
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.15 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_H2", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H3"));
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.05;
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.05 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_H3", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_H4"));
		var array = -4;
		array[0] = _camera.centeredcam_x * 0.005;
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.005 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_H4", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_V1"));
		var array = -4;
		array[0] = _camera.cam_x - clamp(_camera.cam_x * 0.25 * (960 / room_width), 0, sprite_get_width(layer_background_get_sprite(back_id)) - 960);
		array[1] = _camera.centeredcam_y * 0.25;
		return array;
	};
	add_parallax_function("Backgrounds_V1", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_V2"));
		var array = -4;
		array[0] = _camera.cam_x - clamp(_camera.cam_x * 0.15 * (960 / room_width), 0, sprite_get_width(layer_background_get_sprite(back_id)) - 960);
		array[1] = _camera.centeredcam_y * 0.15;
		return array;
	};
	add_parallax_function("Backgrounds_V2", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far"));
		var array = -4;
		array[0] = _camera.cam_x - clamp(_camera.cam_x * 0.3 * (960 / room_width), 0, sprite_get_width(layer_background_get_sprite(back_id)) - 960);
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.3 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_far", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far1"));
		var array = -4;
		array[0] = _camera.cam_x - clamp(_camera.cam_x * 0.25 * (960 / room_width), 0, sprite_get_width(layer_background_get_sprite(back_id)) - 960);
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.25 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_far1", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far2"));
		var array = -4;
		array[0] = _camera.cam_x - clamp(_camera.cam_x * 0.15 * (960 / room_width), 0, sprite_get_width(layer_background_get_sprite(back_id)) - 960);
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.15 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_far2", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_far3"));
		var array = -4;
		array[0] = _camera.cam_x - clamp(_camera.cam_x * 0.05 * (960 / room_width), 0, sprite_get_width(layer_background_get_sprite(back_id)) - 960);
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.05 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_far3", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.cam_x;
		array[1] = _camera.cam_y;
		return array;
	};
	add_parallax_function("Backgrounds_still", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.cam_x * 0.25;
		array[1] = _camera.cam_y;
		return array;
	};
	add_parallax_function("Backgrounds_stillh", bg, _bool);
	bg = function()
	{
		var array = -4;
		array[0] = 0;
		array[1] = 0;
		return array;
	};
	add_parallax_function("Backgrounds_stilld", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = _camera.cam_x;
		array[1] = 0;
		return array;
	};
	add_parallax_function("Backgrounds_cloud", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var array = -4;
		array[0] = 0;
		array[1] = _camera.cam_y * 0.99;
		return array;
	};
	add_parallax_function("Backgrounds_moon", bg, _bool);
	bg = function()
	{
		var _camera = new camera_get_position_struct(view_camera[0]);
		var back_id = layer_background_get_id_fixed(layer_get_id("Backgrounds_still1"));
		var array = -4;
		array[0] = _camera.cam_x - clamp(_camera.cam_x * 0.15 * (960 / room_width), 0, sprite_get_width(layer_background_get_sprite(back_id)) - 960);
		array[1] = _camera.cam_y - clamp(_camera.cam_y * 0.15 * (540 / room_height), 0, sprite_get_height(layer_background_get_sprite(back_id)) - 540);
		return array;
	};
	add_parallax_function("Backgrounds_still1", bg, _bool);
	bg = undefined;
}
