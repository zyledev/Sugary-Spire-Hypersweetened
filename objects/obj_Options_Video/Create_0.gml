enum video_selected
{
	back,
	fullscreen,
	resolution,
	smoothcam,
	screentilt
};
optionselected = video_selected.back;
ini_open("optionData.ini");
global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
global.selectedResolution = ini_read_real("Settings", "resolution", 1);
global.smoothcam = ini_read_real("Settings", "smthcam", 1);
global.hitstunEnabled = ini_read_real("Settings", "hitstun", 1);
global.screentilt = ini_read_real("Settings", "scrntilt", 1);
global.playerrotate = ini_read_real("Settings", "playrot", 1);
ini_close();
optionsaved_fullscreen = global.fullscreen;
optionsaved_resolution = global.selectedResolution;
optionsaved_smoothcam = global.smoothcam;
optionsaved_screentilt = global.screentilt;
optionsaved_hitstun = global.hitstunEnabled;
subtitle = "GO BACK TO MAIN SCREEN";
CursorY = -999;
depth = -100;
selecting = -1;
obj_Options_Main.CursorY = -999;
canmove = false;
alarm[0] = 1;
