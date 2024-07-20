function scr_slopeangle(_x = x, _y = y)
{
	var array = 0;
	var checkside = -1;
	var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
	var top = -3;
	var i = 0;
	array[0] = y;
	for (array[1] = y; i < 2; i++)
	{
		while (top < height)
		{
			array[i] = y;
			var check_1 = scr_solid_player(x + (3 * checkside), y + top);
			var check_2 = !scr_solid_player(x + (3 * checkside), (y + top) - 1);
			if (check_1 && check_2)
			{
				var sex = (y + top) - 1;
				array[i] = sex;
				break;
			}
			top++;
		}
		checkside = !checkside;
	}
	var pointer1 = array[0];
	var pointer2 = array[1];
	var _angle = 0;
	if (pointer1 != pointer2)
		_angle = point_direction(x - 3, pointer1, x + 3, pointer2);
	return _angle;
}
function scr_slopeanglenonplayer(_x, _y)
{
	var array = 0;
	var checkside = -1;
	var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
	var top = -3;
	var i = 0;
	array[0] = _y;
	for (array[1] = _y; i < 2; i++)
	{
		while (top < height)
		{
			array[i] = _y;
			var check_1 = scr_solid(_x + (1 * checkside), _y + top);
			var check_2 = !scr_solid(_x + (1 * checkside), (_y + top) - 1);
			if (check_1 && check_2)
			{
				var sex = (_y + top) - 1;
				array[i] = sex;
				break;
			}
			top++;
		}
		checkside = !checkside;
	}
	var pointer1 = array[0];
	var pointer2 = array[1];
	var _angle = 0;
	if (pointer1 != pointer2)
		_angle = point_direction(_x - 1, pointer1, _x + 1, pointer2);
	return _angle;
}
