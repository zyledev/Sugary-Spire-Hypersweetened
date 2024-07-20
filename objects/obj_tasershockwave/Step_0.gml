timer--;
if (timer < 0)
	timer = 0;
if (timer == 0)
	instance_destroy();
