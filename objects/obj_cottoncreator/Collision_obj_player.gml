with (obj_player)
{
	if (state != states.cotton && state != states.cottondrill && state != states.door && state != states.cottonroll && state != states.pizzanoshoulderbash)
	{
		global.combofreeze = 30;
		state = states.cotton;
		instance_create(x, y, obj_poofeffect);
		instance_create(x, y, obj_poofeffectcotton);
		sprite_index = spr_cottonidle;
	}
}
