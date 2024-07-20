function scr_confecti_init()
{
	ds_list_add(global.FollowerList, id);
	switch (object_index)
	{
		default:
			spr_idle = spr_marshmellow_idle;
			spr_run = spr_marshemellow_run;
			spr_panic = spr_marshmellow_panic;
			spr_appear = spr_marshmallow_appear;
			spr_taunt = spr_marshmellow_taunt;
			global.mallowfollow = true;
			break;
		case obj_confectichoco:
			spr_idle = spr_chocolate_idle;
			spr_run = spr_chocolate_walk;
			spr_panic = spr_chocolate_panic;
			spr_appear = spr_chocolate_appear;
			spr_taunt = spr_chocolate_taunt;
			global.chocofollow = true;
			break;
		case obj_confecticrack:
			spr_idle = spr_crack_idle;
			spr_run = spr_crack_run;
			spr_panic = spr_crack_panic;
			spr_appear = spr_crack_appear;
			spr_taunt = spr_crack_taunt;
			global.crackfollow = true;
			break;
		case obj_confectiworm:
			spr_idle = spr_gummyworm_idle;
			spr_run = spr_gummyworm_walk;
			spr_panic = spr_gummyworm_panic;
			spr_appear = spr_gummyworm_appear;
			spr_taunt = spr_gummyworm_taunt;
			global.wormfollow = true;
			break;
		case obj_confecticandy:
			spr_idle = spr_candy_idle;
			spr_run = spr_candy_walk;
			spr_panic = spr_candy_panic;
			spr_appear = spr_candy_appear;
			spr_taunt = spr_candy_taunt;
			global.candyfollow = true;
			break;
	}
}
