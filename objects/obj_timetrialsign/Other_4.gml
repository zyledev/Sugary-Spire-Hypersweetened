ini_open("saveData.ini");
timetrialtime = ini_read_string("Ranks", "timetrial", "none");
ini_close();
if (timetrialtime == "none")
	visible = false;
else
	visible = true;
