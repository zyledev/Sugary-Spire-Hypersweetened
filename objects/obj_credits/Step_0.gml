input_check(input);
// move credits up lol
if (max_height)
	_y += 1

if (input.key_exit.pressed)
{
	with (instance_create(0, 0, obj_fadeout))
	{
		obj_player.targetRoom = realtitlescreen
		obj_player.targetDoor = "A"
		obj_player.state = states.titlescreen
	}
}