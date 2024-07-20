function scr_solid(_x, _y, _is_slope = false)
{
	var old_x = x;
	var old_y = y;
	x = _x;
	y = _y;
	if (place_meeting(x, y, obj_solid))
	{
		x = old_x;
		y = old_y;
		return true;
	}
	var platform = -4;
	if (place_meeting(x, y, obj_platform))
	{
		platform = instance_place(x, y, obj_platform);
		if (y > old_y)
		{
			var _list = ds_list_create();
			var _platforms = instance_place_list(x, y, obj_platform, _list, false);
			var collided = false;
			if (_platforms > 0)
			{
				for (var i = 0; i < _platforms; i++)
				{
					platform = ds_list_find_value(_list, i);
					var _can_collide = platform.can_collide(object_index);
					if (_can_collide && place_meeting(x, y, platform) && !place_meeting(x, old_y, platform))
						collided = true;
				}
			}
			ds_list_destroy(_list);
			if (collided)
			{
				x = old_x;
				y = old_y;
				return true;
			}
		}
	}
	var slope = instance_place(x, y, obj_slope);
	if (slope && !_is_slope)
	{
		with (slope)
		{
			var object_side = 0;
			var slope_start = 0;
			var slope_end = 0;
			if (image_xscale > 0)
			{
				object_side = other.bbox_right;
				slope_start = bbox_bottom;
				slope_end = bbox_top;
			}
			else
			{
				object_side = other.bbox_left;
				slope_start = bbox_top;
				slope_end = bbox_bottom;
			}
			var m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
			slope = slope_start - round(m * (object_side - bbox_left));
			if (other.bbox_bottom >= slope)
			{
				other.x = old_x;
				other.y = old_y;
				return true;
			}
		}
	}
	if (place_meeting(x, y, obj_minecartRail_Slope))
	{
		var grindslope = instance_place(x, y, obj_minecartRail_Slope);
		with (grindslope)
		{
			var gobject_side = 0;
			var gslope_start = 0;
			var gslope_end = 0;
			if (image_xscale > 0)
			{
				gobject_side = other.bbox_right;
				gslope_start = bbox_bottom;
				gslope_end = bbox_top;
			}
			else
			{
				gobject_side = other.bbox_left;
				gslope_start = bbox_top;
				gslope_end = bbox_bottom;
			}
			var n = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
			var grindsslope = gslope_start - round(n * (gobject_side - bbox_left));
			if (other.y >= old_y && can_collide(other.object_index) && other.bbox_bottom == grindsslope && other.bbox_top < grindsslope && gobject_side != grindsslope)
			{
				other.x = old_x;
				other.y = old_y;
				return true;
			}
		}
	}
	x = old_x;
	y = old_y;
	return false;
}
