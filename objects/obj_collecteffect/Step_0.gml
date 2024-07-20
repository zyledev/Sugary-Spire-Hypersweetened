var scale = 1.25;
var distance = point_distance(drawx, drawy, targetx, targety);
if (biggening)
	drawxscale = approach(drawxscale, scale, 0.15);
else if (!biggening && distance >= 96)
	drawxscale = approach(drawxscale, 0.85, 0.15);
else
	drawxscale = approach(drawxscale, 0, 0.25);
if (drawxscale == scale)
	biggening = false;
drawyscale = drawxscale;
