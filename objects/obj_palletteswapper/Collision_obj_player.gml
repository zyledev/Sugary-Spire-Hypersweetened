if (obj_player.input.key_up.pressed && !drawing)
{
	drawing = true;
	obj_player.state = states.pal;
}
