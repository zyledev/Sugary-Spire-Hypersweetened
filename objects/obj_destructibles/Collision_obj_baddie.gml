if (other.state == baddiestates.stun && other.thrown)
{
	DestroyedBy = other.id;
	event_user(0);
}
