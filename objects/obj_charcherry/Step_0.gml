if (flash && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (sprite_index != spr_charcherry_wait && !global.panic)
	sprite_index = spr_charcherry_wait;
if (state != baddiestates.cherrywait && state != baddiestates.charcherry)
	state = baddiestates.cherrywait;
