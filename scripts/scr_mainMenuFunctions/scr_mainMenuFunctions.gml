function mainmenu_playbutton()
{
	can_move = false;
	alarm[0] = 50
}

function mainmenu_optionbutton()
{
	can_move = false;
	instance_create(0, 0, obj_Options_Main);
}

function mainmenu_exitbutton()
{
	game_end();
}
function mainmenu_creditsbutton()
{
	with instance_create(x, y, obj_fadeout)
	{
		obj_player.targetRoom = rm_credits;
		obj_player.targetDoor = "A";
	}
}
