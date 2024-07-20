enum states {
    normal, // 0
    titlescreen, // 1
    hookshot, // 2
    slap, // 3
    charge, // 4
    cheesepep, // 5
    cheeseball, // 6
    cheesepepstick, // 7
    boxxedpep, // 8
    pistolaim, // 9
    climbwall, // 10
    knightpepslopes, // 11
    portal, // 12
    secondjump, // 13
    chainsawbump, // 14
    handstandjump, // 15
    gottreasure, // 16
    knightpep, // 17
    knightpepattack, // 18
    meteorpep, // 19
    bombpep, // 20
    grabbing, // 21
    chainsawpogo, // 22
    shotgunjump, // 23
    stunned, // 24
    highjump, // 25
    chainsaw, // 26
    facestomp, // 27
    timesup, // 28
    machroll, // 29
    pistol, // 30
    shotgun, // 31
    machfreefall, // 32
    throwing, // 33
    superslam, // 34
    slam, // 35
    skateboard, // 36
    grind, // 37
    grab, // 38
    punch, // 39
    backkick, // 40
    uppunch, // 41
    shoulder, // 42
    backbreaker, // 43
    bossdefeat, // 44
    bossintro, // 45
    smirk, // 46
    pizzathrow, // 47
    gameover, // 48
    Sjumpland, // 49
    freefallprep, // 50
    runonball, // 51
    boulder, // 52
    keyget, // 53
    tackle, // 54
    slipnslide, // 55
    ladder, // 56
    jump, // 57
    victory, // 58
    comingoutdoor, // 59
    Sjump, // 60
    Sjumpprep, // 61
    crouch, // 62
    crouchjump, // 63
    crouchslide, // 64
    mach1, // 65
    mach2, // 66
    mach3, // 67
    machslide, // 68
    bump, // 69
    hurt, // 70
    freefall, // 71
    freefallland, // 72
    hang, // 73
    door, // 74
    barrelnormal, // 75
    barrelfall, // 76
    barrelmach1, // 77
    barrelmach2, // 78
    barrelfloat, // 79
    barrelcrouch, // 80
    barrelslipnslide, // 81
    barrelroll, // 82
    current, // 83
    finishingblow, // 84
    cotton, // 85
    uppercut, // 86
    pal, // 87
    shocked, // 88
    bushdisguise, // 89
    parry, // 90
    talkto, // 91
    puddle, // 92
    tumble, // 93
    cottondrill, // 94
    cottonroll, // 95
    fling, // 96
    breakdance, // 97
    minecart, // 98
    squished, // 99
    machtumble, // 100
	rocketfistpizzano, // 101
	machpizzano, // 102
	fireass, // 103
    geyser, // 104
    actor, // 105
	coneboyinhale1, // 106
	coneboyinhale2, // 107
	coneboyinhale3, // 108
	gumbobpropellor, // 109
	gumbobmixnbrew, // 110
	pizzanotwirl, // 111
	pizzanoshoulderbash, // 112
	pizzanowallcling, // 113
    mini // 114
    
};


function scr_playerstate()
{
	var _stateFunction = undefined;
	switch (state)
	{
		case states.normal:
			_stateFunction = scr_player_normal;
			break;
		case states.titlescreen:
			_stateFunction = scr_player_titlescreen;
			break;
		case states.hookshot:
			_stateFunction = scr_playerN_hookshot;
			break;
		case states.slap:
			_stateFunction = scr_player_slap;
			break;
		case states.charge:
			_stateFunction = scr_player_charge;
			break;
		case states.cheesepep:
			_stateFunction = scr_player_cheesepep;
			break;
		case states.cheeseball:
			_stateFunction = scr_player_cheeseball;
			break;
		case states.cheesepepstick:
			_stateFunction = scr_player_cheesepepstick;
			break;
		case states.boxxedpep:
			_stateFunction = scr_player_boxxedpep;
			break;
		case states.pistolaim:
			_stateFunction = scr_player_pistolaim;
			break;
		case states.climbwall:
			_stateFunction = scr_player_climbwall;
			break;
		case states.knightpepslopes:
			_stateFunction = scr_player_knightpepslopes;
			break;
		case states.portal:
			_stateFunction = scr_player_portal;
			break;
		case states.secondjump:
			_stateFunction = scr_player_secondjump;
			break;
		case states.chainsawbump:
			_stateFunction = scr_player_chainsawbump;
			break;
		case states.handstandjump:
			_stateFunction = scr_player_handstandjump;
			break;
		case states.gottreasure:
			_stateFunction = scr_player_gottreasure;
			break;
		case states.knightpep:
			_stateFunction = scr_player_knightpep;
			break;
		case states.knightpepattack:
			_stateFunction = scr_player_knightpepattack;
			break;
		case states.meteorpep:
			_stateFunction = scr_player_meteorpep;
			break;
		case states.bombpep:
			_stateFunction = scr_player_bombpep;
			break;
		case states.grabbing:
			_stateFunction = scr_player_grabbing;
			break;
		case states.chainsawpogo:
			_stateFunction = scr_player_chainsawpogo;
			break;
		case states.shotgunjump:
			_stateFunction = scr_player_shotgunjump;
			break;
		case states.stunned:
			_stateFunction = scr_player_stunned;
			break;
		case states.highjump:
			_stateFunction = scr_player_highjump;
			break;
		case states.chainsaw:
			_stateFunction = scr_player_chainsaw;
			break;
		case states.facestomp:
			_stateFunction = scr_player_facestomp;
			break;
		case states.timesup:
			_stateFunction = scr_player_timesup;
			break;
		case states.machroll:
			_stateFunction = scr_player_machroll;
			break;
		case states.pistol:
			_stateFunction = scr_player_pistol;
			break;
		case states.shotgun:
			_stateFunction = scr_player_shotgun;
			break;
		case states.machfreefall:
			_stateFunction = scr_player_machfreefall;
			break;
		case states.throwing:
			_stateFunction = scr_player_throw;
			break;
		case states.superslam:
			_stateFunction = scr_player_superslam;
			break;
		case states.slam:
			_stateFunction = scr_player_slam;
			break;
		case states.skateboard:
			_stateFunction = scr_player_skateboard;
			break;
		case states.grind:
			_stateFunction = scr_player_grind;
			break;
		case states.grab:
			_stateFunction = scr_player_grab;
			break;
		case states.punch:
			_stateFunction = scr_player_punch;
			break;
		case states.backkick:
			_stateFunction = scr_player_backkick;
			break;
		case states.uppunch:
			_stateFunction = scr_player_uppunch;
			break;
		case states.shoulder:
			_stateFunction = scr_player_shoulder;
			break;
		case states.backbreaker:
			_stateFunction = scr_player_backbreaker;
			break;
		case states.bossdefeat:
			_stateFunction = scr_player_bossdefeat;
			break;
		case states.bossintro:
			_stateFunction = scr_player_bossintro;
			break;
		case states.smirk:
			_stateFunction = scr_player_smirk;
			break;
		case states.pizzathrow:
			_stateFunction = scr_player_pizzathrow;
			break;
		case states.gameover:
			_stateFunction = scr_player_gameover;
			break;
		case states.Sjumpland:
			_stateFunction = scr_player_Sjumpland;
			break;
		case states.freefallprep:
			_stateFunction = scr_player_freefallprep;
			break;
		case states.runonball:
			_stateFunction = scr_player_runonball;
			break;
		case states.boulder:
			_stateFunction = scr_player_boulder;
			break;
		case states.keyget:
			_stateFunction = scr_player_keyget;
			break;
		case states.tackle:
			_stateFunction = scr_player_tackle;
			break;
		case states.slipnslide:
			_stateFunction = scr_player_slipnslide;
			break;
		case states.ladder:
			_stateFunction = scr_player_ladder;
			break;
		case states.jump:
			_stateFunction = scr_player_jump;
			break;
		case states.victory:
			_stateFunction = scr_player_victory;
			break;
		case states.comingoutdoor:
			_stateFunction = scr_player_comingoutdoor;
			break;
		case states.Sjump:
			_stateFunction = scr_player_Sjump;
			break;
		case states.Sjumpprep:
			_stateFunction = scr_player_Sjumpprep;
			break;
		case states.crouch:
			_stateFunction = scr_player_crouch;
			break;
		case states.crouchjump:
			_stateFunction = scr_player_crouchjump;
			break;
		case states.crouchslide:
			_stateFunction = scr_player_crouchslide;
			break;
		case states.mach1:
			_stateFunction = scr_player_mach1;
			break;
		case states.mach2:
			_stateFunction = scr_player_mach2;
			break;
		case states.mach3:
			_stateFunction = scr_player_mach3;
			break;
		case states.machslide:
			_stateFunction = scr_player_machslide;
			break;
		case states.bump:
			_stateFunction = scr_player_bump;
			break;
		case states.hurt:
			_stateFunction = scr_player_hurt;
			break;
		case states.freefall:
			_stateFunction = scr_player_freefall;
			break;
		case states.freefallland:
			_stateFunction = scr_player_freefallland;
			break;
		case states.hang:
			_stateFunction = scr_player_hang;
			break;
		case states.door:
			_stateFunction = scr_player_door;
			break;
		case states.barrelnormal:
			_stateFunction = scr_player_barrelnormal;
			break;
		case states.barrelfall:
			_stateFunction = scr_player_barrelfall;
			break;
		case states.barrelmach1:
			_stateFunction = scr_player_barrelmach1;
			break;
		case states.barrelmach2:
			_stateFunction = scr_player_barrelmach2;
			break;
		case states.barrelfloat:
			_stateFunction = scr_player_barrelfloat;
			break;
		case states.barrelcrouch:
			_stateFunction = scr_player_barrelcrouch;
			break;
		case states.barrelslipnslide:
			_stateFunction = scr_player_barrelslipnslide;
			break;
		case states.barrelroll:
			_stateFunction = scr_player_barrelroll;
			break;
		case states.current:
			_stateFunction = scr_player_current;
			break;
		case states.finishingblow:
			_stateFunction = scr_player_finishingblow;
			break;
		case states.cotton:
			_stateFunction = scr_player_cotton;
			break;
		case states.uppercut:
			_stateFunction = scr_player_uppercut;
			break;
		case states.pal:
			_stateFunction = scr_player_pal;
			break;
		case states.shocked:
			_stateFunction = scr_player_shocked;
			break;
		case states.bushdisguise:
			_stateFunction = scr_player_bushdisguise;
			break;
		case states.parry:
			_stateFunction = scr_player_parry;
			break;
		case states.tumble:
			_stateFunction = scr_player_tumble;
			break;
		case states.talkto:
			_stateFunction = scr_player_talkto;
			break;
		case states.puddle:
			_stateFunction = scr_player_puddle;
			break;
		case states.cottondrill:
			_stateFunction = scr_player_cottondrill;
			break;
		case states.cottonroll:
			_stateFunction = scr_player_cottonroll;
			break;
		case states.fling:
			_stateFunction = scr_player_fling;
			break;
		case states.breakdance:
			_stateFunction = scr_player_breakdance;
			break;
		case states.gumbobpropellor:
			_stateFunction = scr_gumbob_propeller;
			break;
		case states.gumbobmixnbrew:
			_stateFunction = scr_gumbob_mixnbrew;
			break;
		case states.minecart:
			_stateFunction = scr_player_minecart;
			break;
		case states.fireass:
			_stateFunction = scr_player_fireass;
			break;
		case states.squished:
			_stateFunction = scr_player_squished;
			break;
		case states.machtumble:
			_stateFunction = scr_player_machtumble;
			break;
		case states.machpizzano:
			_stateFunction = scr_mach_pizzano;
			break;
		case states.rocketfistpizzano:
			_stateFunction = scr_rocketfist_pizzano;
			break;
		case states.coneboyinhale1:
			_stateFunction = scr_coneboy_inhale;
			break;
		case states.coneboyinhale2:
			_stateFunction = scr_coneboy_inhale;
			break;
		case states.coneboyinhale3:
			_stateFunction = scr_coneboy_inhale;
			break;
		case states.geyser:
			_stateFunction = scr_player_geyser;
			break;
		case states.pizzanotwirl:
			_stateFunction = scr_pizzano_twirl;
			break;
		case states.pizzanoshoulderbash:
			_stateFunction = scr_pizzano_shoulderbash;
			break;
		case states.pizzanowallcling:
			_stateFunction = scr_pizzano_wallcling;
			break;
		case states.actor:
			_stateFunction = scr_player_actor;
			break;
		case states.mini:
			_stateFunction = scr_player_mini;
			break;
	}
	stateName = "states.undefined";
	if (!is_undefined(_stateFunction))
	{
		_stateFunction();
		stateName = "states." + string_extract(script_get_name(_stateFunction), "_", 1) + string_extract(script_get_name(_stateFunction), "_", 3);
	}
}
