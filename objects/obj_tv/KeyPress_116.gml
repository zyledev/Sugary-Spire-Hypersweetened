if (obj_player.character == "P")
{
	obj_player.character = "N";
	scr_characterspr();
	scr_tvsprites();
	tvcount = 500;
}
else if (obj_player.character == "N")
{
	obj_player.character = "P";
	scr_tvsprites();
	tvcount = 500;
}
