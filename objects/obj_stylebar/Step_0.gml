if (global.style > 55 && global.stylethreshold < 4)
{
	global.stylethreshold += 1;
	global.style = global.style - 55;
}
if (global.style < 0 && global.stylethreshold != 0)
{
	global.stylethreshold -= 1;
	global.style = global.style + 55;
}
if (global.style < 0 && global.stylethreshold == 0)
	global.style = 0;
if (global.stylethreshold == 4 && global.style > 55)
	global.style = 55;
alpha = obj_tv.alpha;
switch (global.stylethreshold)
{
	case 0:
		image_speed = 0;
		obj_camera.heatpal = 0;
		image_index = 0;
		break;
	case 1:
		image_speed = 0.2;
		obj_camera.heatpal = 1;
		break;
	case 2:
		image_speed = 0.25;
		obj_camera.heatpal = 2;
		break;
	case 3:
		image_speed = 0.3;
		obj_camera.heatpal = 3;
		break;
	case 4:
		image_speed = 0.35;
		obj_camera.heatpal = 4;
		break;
}
switch (floor(image_index))
{
	case 0:
		hudbounce = 0;
		break;
	case 1:
		hudbounce = 1;
		break;
	case 2:
		hudbounce = 2;
		break;
	case 3:
		hudbounce = 3;
		break;
	case 4:
		hudbounce = 4;
		break;
	case 5:
		hudbounce = 5;
		break;
	case 6:
		hudbounce = 3;
		break;
	case 7:
		hudbounce = 0;
		break;
	case 8:
		hudbounce = -1;
		break;
	case 9:
		hudbounce = -2;
		break;
	case 10:
		hudbounce = -3;
		break;
	case 11:
		hudbounce = -2;
		break;
	case 12:
		hudbounce = -1;
		break;
	case 13:
		hudbounce = 0;
		break;
}
if (floor(image_index) == 13)
	image_index = 0;
