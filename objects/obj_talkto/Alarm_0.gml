if (is_error)
{
	sprite_index = choose(spr_man, spr_man, spr_man, spr_man, spr_man, spr_man, spr_ket, spr_collect1, spr_introrock, spr_soda, spr_rod, spr_mineken, spr_bigcollect1, spr_juicedead, spr_pizzano_bomb, spr_hatty, spr_slim, spr_duck, spr_player_uppizzabox, spr_ufra, spr_gummyworm_idle, spr_player_airdash1);
	image_speed = random_range(0.35, 2);
	image_angle = random_range(0, 360);
	error_shake = irandom_range(-1, 10);
}
alarm[0] = irandom_range(5, 75);
