var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
depth = -10;
image_speed = 0;
image_index = 0;
choosed = false;
drawx = xstart - _cam_x;
drawy = ystart - _cam_y;
drawxscale = 1;
drawyscale = 1;
biggening = true;
targetx = 150;
targety = 100;
if (!choosed)
{
	playerid = obj_player;
	switch (playerid.character)
	{
		default:
			sprite_index = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
			break;
	}
}
