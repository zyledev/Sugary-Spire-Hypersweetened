if (showtext)
{
	if (draw_y < 35)
		draw_y += 5;
	else
		draw_y = 35;
}
if (!showtext)
{
	if (draw_y > -64)
		draw_y -= 1;
	else
		draw_y = -64;
}
if (instance_exists(obj_player))
{
	if (obj_player.y < (180 + obj_camera.Cam_y) && obj_player.x >= ((obj_camera.Cam_x + (obj_camera.Camera_width / 2)) - 200) && obj_player.x < (obj_camera.Cam_x + (obj_camera.Camera_width / 2) + 200))
		alpha = 0.5;
	else
		alpha = 1;
}
