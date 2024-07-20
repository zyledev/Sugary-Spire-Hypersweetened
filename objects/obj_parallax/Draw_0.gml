if (surface_exists(RealSurface))
{
	surface_set_target(RealSurface);
	draw_clear_alpha(c_white, 0);
	if (surface_exists(global.parallaxbg_surface))
	{
		if (global.panic && global.panicbg)
		{
			shader_set(shd_panicbg);
			var panic_id = shader_get_uniform(shd_panicbg, "panic");
			shader_set_uniform_f(panic_id, global.wave / global.maxwave);
			var time_id = shader_get_uniform(shd_panicbg, "time");
			shader_set_uniform_f(time_id, current_time / 1000);
			draw_surface_ext(global.parallaxbg_surface, -64, -64, 1, 1, 0, c_white, 1);
			shader_reset();
		}
		else
			draw_surface_ext(global.parallaxbg_surface, -64, -64, 1, 1, 0, c_white, 1);
	}
	surface_reset_target();
	var rotation = camera_get_view_angle(view_camera[0]);
	var tx = -(camera_get_view_width(view_camera[0]) div 2);
	var ty = -(camera_get_view_height(view_camera[0]) div 2);
	var rot_x = (tx * cos(degtorad(rotation))) - (ty * sin(degtorad(rotation)));
	var rot_y = (tx * sin(degtorad(rotation))) + (ty * cos(degtorad(rotation)));
	var cam_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
	var cam_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
	var draw_x = cam_x + rot_x;
	var draw_y = cam_y + rot_y;
	draw_surface_ext(RealSurface, draw_x, draw_y, camera_get_view_width(view_camera[0]) / 960, camera_get_view_height(view_camera[0]) / 540, -rotation, c_white, 1);
}
else
	RealSurface = surface_create(960, 540);
