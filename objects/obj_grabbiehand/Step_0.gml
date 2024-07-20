if (floor(image_index) == (image_number - 1) && sprite_index == spr_grabbiehand_hifive)
{
	sprite_index = spr_grabbiehand_idle;
	thumbingup = false;
	image_xscale = 1;
}
if ((x <= (xstarte + 6) && x >= (xstarte - 6)) && ((y <= (ystarte + 6) && y >= (ystarte - 6)) && ((obj_player.x > (x - 50) && obj_player.x < (x + 50)) && ((obj_player.y > y && obj_player.y < (y + 400)) && !thumbingup))))
{
	delay--;
	if (delay <= 0)
	{
		grav = 0.35;
		vsp = 10;
		sprite_index = spr_grabbiehand_fall;
		delay = 5;
	}
}
if (grabbing && grounded)
	grounded = false;
if (grounded && (sprite_index == spr_grabbiehand_fall && !grabbing))
{
	grav = 0;
	sprite_index = spr_grabbiehand_idle;
	vsp = -5;
}
if ((y <= (ystarte + 6) && y >= (ystarte - 6)) && (vsp == -3 && !grabbing))
	vsp = 0;
if (sprite_index == spr_grabbiehand_catch && (!released && grabbing))
{
	if (dropspotx > x)
		x += 4;
	if (dropspotx < x)
		x -= 4;
	if (dropspoty > y)
		y += 4;
	if (dropspoty < y)
		y -= 4;
}
if ((x <= (dropspotx + 5) && x >= (dropspotx - 5)) && ((y <= (dropspoty + 5) && y >= (dropspoty - 5)) && (!released && grabbing)))
{
	obj_player.state = states.normal;
	image_index = 0;
	sprite_index = spr_grabbiehand_release;
	released = true;
}
if (sprite_index == spr_grabbiehand_release && (floor(image_index) == (image_number - 1) && (released && grabbing)))
	sprite_index = spr_grabbiehand_idle;
if (sprite_index == spr_grabbiehand_idle && (released && grabbing))
{
	if (xstarte > x)
		x += 4;
	if (xstarte < x)
		x -= 4;
	if (ystarte > y)
		y += 4;
	if (ystarte < y)
		y -= 4;
}
if ((x <= (xstarte + 6) && x >= (xstarte - 6)) && ((y <= (ystarte + 6) && y >= (ystarte - 6)) && (grabbing && sprite_index == spr_grabbiehand_idle)))
{
	grabbing = false;
	released = false;
}
if (!grabbing)
	scr_collide();
if (movingupwards)
	y -= 2;
if (movingupwards && y < ystart)
{
	y = ystart;
	movingupwards = false;
}
