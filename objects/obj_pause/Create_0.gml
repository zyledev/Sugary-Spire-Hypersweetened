input = 
{
	key_jump : new Input(global.keybinds.key_jump),
	key_up : new Input(global.keybinds.key_up),
	key_down : new Input(global.keybinds.key_down),
	key_pause : new Input(global.keybinds.key_start),
	key_confirm : new Input(global.keybinds.key_jump)
}
canmove = true;
global.pause = false;

function create_pausebutton(_name, _callback)
{
	return { name : _name, callback : _callback, x : 0, is_selected : false };
}

options = 
[
	create_pausebutton("PLAY", function() { event_user(0) }),
	create_pausebutton("RETRY", function() { event_user(1) }),
	create_pausebutton("OPTIONS", function() { event_user(3) }),
	create_pausebutton("EXIT", function() { event_user(2) })
]
alpha = 0;
screenshot = undefined;
i = 0;
color = make_color_rgb(121, 103, 151);
selected = 0;
image_speed = 0;
shroomdone = 0;
cheesedone = 0;
tomatodone = 0;
sausagedone = 0;
pineappledone = 0;
depth = -98;
draw_screen = 0;
pal = 1;
scroll = 0;