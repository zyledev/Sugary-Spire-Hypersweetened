pausedmusic = 0;
fadeoff = 0;
is_playing = true;
currently_playing = undefined;
room_found = false;
saved_position = undefined;

music_values =
{
	titlescreen : new Music([realtitlescreen], mu_title),
	hub : new Music([outer_room1, hub_room1], mu_hub),
	missing : new Music([rm_missing], mu_void),
	titlescreen : new Music([realtitlescreen], mu_title),
	credits : new Music([rm_credits], mu_credits),
	tutorial : new Music([tutorial_1], mu_tutorial),
	devroom : new Music([devroom], mu_what),
	palroom : new Music([palroom], mu_paletteselect),
	//levels
	entryway : new Music([entryway_1, entryway_3, entryway_6, entryway_9], mu_waffle),
	entrywaysecret : new Music([entrywaysecret_1, entrywaysecret_2, entrywaysecret_3], mu_wafflesecret, true),
	steamy : new Music([steamy_1, steamy_7, steamy_6, steamy_3], mu_steamy),
	steamy2 : new Music([steamy_8], mu_steamyinner),
	steamysecret : new Music([steamy_secret1, steamy_secret2, steamy_secret3, steamy_secret4], mu_steamysecret),
	molasses : new Music([molasses_1, molasses_4, molasses_8, molasses_6], mu_swamp),
	molassessecret : new Music([molassessecret_1, molassessecret_2, molassessecret_3], mu_swampsecret, true),
	mines : new Music([mines_1, mines_6], mu_mineshaft1),
	minessecret : new Music([minessecret_1, minessecret_2, minessecret_3], mu_minessecret)

	
};
