if (fadealpha > 1)
{
	scr_escapebgs();
	fadein = true;
}
if (!fadein)
	fadealpha += 0.375;
else if (fadein)
	fadealpha -= 0.375;
if (fadealpha == 0)
	instance_destroy();
