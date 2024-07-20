if (obj_player.state != states.talkto)
	drawing = false;
error_shake = min(error_shake + 0.05, 12);
if (obj_player.x > x)
	image_xscale = 1;
else
	image_xscale = -1;
