var _is_region_active = false;
var _region = -4;
var _debugZOOM = false;
if (true && keyboard_check(ord("C")))
	_debugZOOM = true;
with (obj_cameraRegion)
{
	if (Region_active && activationCode())
	{
		_region = id;
		with (other)
		{
			if (_region.ClampRight)
				Camera_width = lerp(Camera_width, _region.sprite_width, 0.25);
			else
				Camera_width = lerp(Camera_width, room_width, 0.15);
			if (_region.ClampBottom)
				Camera_height = lerp(Camera_height, _region.sprite_height, 0.25);
			else
				Camera_height = lerp(Camera_height, room_height, 0.15);
			if (_region.ClampLeft)
				Camera_xorigin = lerp(Camera_xorigin, _region.x, 0.25);
			else
				Camera_xorigin = lerp(Camera_xorigin, 0, 0.15);
			if (_region.ClampTop)
				Camera_yorigin = lerp(Camera_yorigin, _region.y, 0.25);
			else
				Camera_yorigin = lerp(Camera_yorigin, 0, 0.15);
			cam_lzoom = lerp(cam_lzoom, _region.zoom, 0.25);
			cam_langle = lerp(cam_langle, -_region.image_angle, 0.25);
			_is_region_active = true;
		}
	}
}
if (!_is_region_active)
{
	Camera_width = lerp(Camera_width, room_width, 0.15);
	Camera_height = lerp(Camera_height, room_height, 0.15);
	Camera_xorigin = lerp(Camera_xorigin, 0, 0.15);
	Camera_yorigin = lerp(Camera_yorigin, 0, 0.15);
	if (!_debugZOOM)
		cam_lzoom = lerp(cam_lzoom, 1, 0.15);
	cam_langle = lerp(cam_langle, 0, 0.15);
}
global.targetCamX = obj_player.x;
global.targetCamY = obj_player.y - 32;
