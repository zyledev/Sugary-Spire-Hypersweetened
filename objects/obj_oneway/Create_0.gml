event_inherited();
solidid = -4;
if (!(ds_list_find_index(global.saveroom, id) != -1))
{
	with (instance_create(x, y, obj_solid))
	{
		other.solidid = id;
		image_xscale = other.image_xscale;
		sprite_index = spr_onewaysolidMASK;
		mask_index = spr_onewaysolidMASK;
	}
}
