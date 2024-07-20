function gmlscripts_unix_timestamp()
{
	var datetime = undefined;
	var timezone = date_get_timezone();
	date_set_timezone(1);
	datetime = (argument_count > 0) ? argument[0] : date_current_datetime();
	var timestamp = round(date_second_span(25569, datetime));
	date_set_timezone(timezone);
	return timestamp;
}
