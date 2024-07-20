mask_index = spr_juicepuddledone;
scr_collide();
if (grounded)
{
	var targetangle = scr_slopeanglenonplayer(x, y);
	var RotationStep = (((abs(hsp) / 16) + (abs(hsp) / 32)) - 2) * -1;
	draw_angle = darctan2(dsin(targetangle) + (dsin(draw_angle) * RotationStep), dcos(targetangle) + (dcos(draw_angle) * RotationStep));
}
else
{
	if (draw_angle <= 0)
		draw_angle += 360;
	if (draw_angle < 180)
		draw_angle = max(draw_angle - 2.8125, 0);
	else
		draw_angle = min(draw_angle + 2.8125, 360);
}
if (grounded && sprite_index != spr_juicepuddledone)
	sprite_index = spr_juicepuddlesplash;
if (animation_end() && sprite_index == spr_juicepuddlesplash)
	sprite_index = spr_juicepuddledone;
if (scr_solid(x, y))
	instance_destroy();
