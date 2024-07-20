scr_hatScript();
scr_playerreset();
obj_player.targetDoor = "A";
obj_player.targetRoom = hub_room1;
audio_stop_all();
instance_create(x, y, obj_fadeout);
