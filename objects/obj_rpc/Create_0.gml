var appID = "862812043034886144";
if (!rousr_dissonance_create(appID))
{
	instance_destroy();
	exit;
}
rousr_dissonance_set_large_image("mainico", "");
global.rpcrank = "D";
rousr_dissonance_set_details("Titlescreen");
