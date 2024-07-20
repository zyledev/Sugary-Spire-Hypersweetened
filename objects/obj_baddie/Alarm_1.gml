var a = irandom_range(-15, 15);
if (state == baddiestates.stun && (hsp != 0 || vsp != 0) && thrown == 1)
	instance_create(x + a + irandom_range(-5, 5), y + a + irandom_range(-5, 5), obj_machalleffect);
alarm[1] = 3;
