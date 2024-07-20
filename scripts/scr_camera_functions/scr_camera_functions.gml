function point_in_camera(_px, _py, _cam)
{
	var cam_x = camera_get_view_x(_cam);
	var cam_y = camera_get_view_y(_cam);
	var cam_w = camera_get_view_width(_cam);
	var cam_h = camera_get_view_height(_cam);
	return point_in_rectangle(_px, _py, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}
function camera_shake(_shake_mag, _shake_mag_acc)
{
	with (obj_camera)
	{
		shake_mag = _shake_mag;
		shake_mag_acc = _shake_mag_acc / room_speed;
	}
	return true;
}
function camera_get_position_struct(_cam) constructor
{
	var _cam_x = camera_get_view_x(_cam);
	var _cam_y = camera_get_view_y(_cam);
	cam_x = _cam_x;
	cam_y = _cam_y;
	centeredcam_x = cam_x + 480;
	centeredcam_y = cam_y + 270;
}
