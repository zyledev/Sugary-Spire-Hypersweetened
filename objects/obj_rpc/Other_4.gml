var roomname = room_get_name(room);
var rpc_message = (scr_roomnames(room) != "NO ROOMNAME FOUND-1265") ? scr_roomnames(room) : "";
switch (string_letters(roomname))
{
	case "hubroom":
		rousr_dissonance_set_large_image("hub", "Hub Room");
		rousr_dissonance_set_details("World 1 Hub");
		break;
	case "tutorial":
		rousr_dissonance_set_large_image("tutorial", "Tutorial");
		rousr_dissonance_set_details(rpc_message);
		break;
	case "entryway":
		rousr_dissonance_set_large_image("entryway", "Entryway");
		rousr_dissonance_set_details(rpc_message);
		break;
	case "molasses":
	case "molassesb":
	case "molassesc":
	case "molassesd":
		rousr_dissonance_set_large_image("molassesswamp", "Molasses Swamp");
		rousr_dissonance_set_details(rpc_message);
		break;
	case "entrywaysecret":
		rousr_dissonance_set_large_image("entrywaysecret", "Entryway Secret");
		rousr_dissonance_set_details(rpc_message);
		break;
	case "steamysecret":
		rousr_dissonance_set_large_image("cottonsecret", "Cottontown Secret");
		rousr_dissonance_set_details(rpc_message);
		break;
	case "molassessecret":
		rousr_dissonance_set_large_image("swampsecret", "Molasses Swamp Secret");
		rousr_dissonance_set_details(rpc_message);
		break;
	case "minessecret":
		rousr_dissonance_set_large_image("minessecret", "Jawbreaker Mines Secret");
		rousr_dissonance_set_details(rpc_message);
		break;
	case "rankroom":
		rousr_dissonance_set_large_image("victory", "Rank Screen");
		break;
}
if (string_letters(roomname) == "steamy")
{
	for (i = 0; i < 20; i++)
	{
		if (roomname == ("steamy_" + string(i)) && i < 8)
		{
			rousr_dissonance_set_large_image("steamy", "Cottontown");
			rousr_dissonance_set_details(rpc_message);
		}
		if (roomname == ("steamy_" + string(i)) && i >= 8)
		{
			rousr_dissonance_set_large_image("clock", "Cottontown's Clock");
			rousr_dissonance_set_details(rpc_message);
		}
	}
}
if (string_letters(roomname) == "mines" || string_letters(roomname) == "minesB")
{
	for (i = 0; i < 15; i++)
	{
		if ((roomname == ("mines_" + string(i)) && i < 7) || (roomname == ("mines_" + string(i) + "B") && i < 7))
		{
			rousr_dissonance_set_large_image("mines", "Jawbreaker Mines");
			rousr_dissonance_set_details(rpc_message);
		}
		if ((roomname == ("mines_" + string(i)) && i >= 7) || (roomname == ("mines_" + string(i) + "B") && i < 7))
		{
			rousr_dissonance_set_large_image("cobalt", "Cobalt Caverns");
			rousr_dissonance_set_details(rpc_message);
		}
	}
}
