scr_getinput();
if (floor(image_index) == (image_number - 1))
	image_speed = 0;
if (obj_player.character == "P")
{
	if (global.rank == "s")
		sprite_index = spr_rankS;
	if (global.rank == "a")
		sprite_index = spr_rankA;
	if (global.rank == "b")
		sprite_index = spr_rankB;
	if (global.rank == "c")
		sprite_index = spr_rankC;
	if (global.rank == "d")
		sprite_index = spr_rankD;
	if (global.rank == "e")
		sprite_index = spr_rankS;
}
