depth = 4;
can_collide = function(_obj = obj_player)
{
	if (_obj == obj_player)
	{
		var wow = _obj.state == states.minecart;
		return wow;
	}
	else if (_obj == obj_minecart || _obj == obj_train)
		return true;
	else
		return false;
};
