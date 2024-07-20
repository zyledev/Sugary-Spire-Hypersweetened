if (instance_exists(baddieID) && baddieID.thrown != 1 && other.baddieID.thrown && baddieID.state != baddiestates.grabbed)
{
	scr_sound(sound_punch);
	instance_destroy(other.baddieID);
	instance_destroy(baddieID);
	instance_destroy(other.id);
	repeat (3)
	{
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
	}
	global.hit += 1;
	global.combotime = 60;
}
