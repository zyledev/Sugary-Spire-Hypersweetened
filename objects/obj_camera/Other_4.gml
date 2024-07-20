x = obj_player.x;
y = obj_player.y;
Camera_width = room_width;
Camera_height = room_height;
Camera_xorigin = 0;
Camera_yorigin = 0;
cam_lzoom = 1;
cam_langle = 0;
var _region = -4;
with (obj_cameraRegion)
{
	if (Region_active && activationCode())
	{
		_region = id;
		with (other)
		{
			if (_region.ClampRight)
				Camera_width = _region.sprite_width;
			if (_region.ClampBottom)
				Camera_height = _region.sprite_height;
			if (_region.ClampLeft)
				Camera_xorigin = _region.x;
			if (_region.ClampTop)
				Camera_yorigin = _region.y;
			cam_lzoom = _region.zoom;
			cam_langle = -_region.image_angle;
		}
	}
}
cam_angle = cam_langle;
cam_zoom = cam_lzoom;
camera_set_view_angle(view_camera[0], cam_angle);
var vw = cam_w * cam_zoom;
var vh = cam_h * cam_zoom;
camera_set_view_size(view_camera[0], vw, vh);
if (instance_exists(obj_player) && (obj_player.state != states.timesup && obj_player.state != states.gameover))
{
	global.targetCamX = obj_player.x;
	global.targetCamY = obj_player.y - 32;
	var target = 
	{
		x: global.targetCamX,
		y: global.targetCamY
	};
	var _cam_x = target.x - (vw / 2);
	var _cam_y = target.y - (vh / 2);
	var _shake_x = 0;
	var _shake_y = 0;
	if (obj_player.state == states.mach3 || (obj_player.state == states.minecart && obj_player.movespeed > 10) || obj_player.state == states.machroll)
	{
		var _targetcharge = obj_player.xscale * ((obj_player.movespeed / 6) * 50);
		var _tspeed = 2;
		if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
			_tspeed = 8;
		if (chargecamera > _targetcharge)
			chargecamera -= _tspeed;
		if (chargecamera < _targetcharge)
			chargecamera += _tspeed;
	}
	else
	{
		if (chargecamera > 0)
			chargecamera -= 2;
		if (chargecamera < 0)
			chargecamera += 2;
	}
	_cam_x += chargecamera;
	_cam_x = clamp(_cam_x, Camera_xorigin, (Camera_xorigin + Camera_width) - vw);
	_cam_y = clamp(_cam_y, Camera_yorigin, (Camera_yorigin + Camera_height) - vh);
	_cam_x = clamp(_cam_x, 0, room_width - vw);
	_cam_y = clamp(_cam_y, 0, room_height - vh);
	Cam_x = _cam_x;
	Cam_y = _cam_y;
	camera_set_view_pos(view_camera[0], Cam_x + _shake_x, Cam_y + _shake_y);
}
global.wave = global.maxwave - (((global.minutes * 60) + global.seconds) * 60);
scr_escapebgs();
