pickthrowtime -= 0.5;
if (((obj_player.x > (x - 300) && obj_player.x < (x + 300)) && (y <= (obj_player.y + 200) && y >= (obj_player.y - 200))) && obj_player.state != states.cotton && obj_player.state != states.cottondrill && obj_player.state != states.door && obj_player.state != states.cottonroll && obj_player.state != states.pizzanoshoulderbash)
{
	sprite_index = spr_lolipopmineranger;
	if (!pickthrowtime)
	{
		with (instance_create(x, y, obj_pickaxeprojectile))
			image_xscale = other.image_xscale;
		pickthrowtime = irandom_range(200, 500);
	}
}
else
	sprite_index = spr_lolipopmineridle;
