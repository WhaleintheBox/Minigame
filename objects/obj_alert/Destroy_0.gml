// Creates variables to check alert status
var _self = self;
var _has_alert = false;
		
// Checks through all the alerts
with (obj_alert)
{
	// Checks if the alert is the same one
	if (self != _self)
	{
		// Sets the has alert flag to true
		_has_alert = true;
	}
}

// Checks if no other alerts exist
if (!_has_alert)
{
	// Stops the sound
	audio_stop_sound(global.alert_sound);	
}