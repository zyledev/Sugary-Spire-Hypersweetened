draw_sprite_ext(sprite_index, -1, drawx, drawy, drawxscale, drawyscale, 0, c_white, image_alpha);
var angle = point_direction(drawx, drawy, targetx, targety);
drawx += lengthdir_x(16, angle);
drawy += lengthdir_y(16, angle);
if (point_in_circle(drawx, drawy, targetx, targety, 32))
{
	with (obj_camera)
		Collectshake = clamp(Collectshake + 1, 2, 5);
	drawx = targetx;
	drawy = targety;
	instance_destroy();
}
