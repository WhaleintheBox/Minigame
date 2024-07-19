// Start object invisible
image_alpha = 0;
// Set target alpha as visible
target_alpha = 1.0;

// Used to set owner object to
owner = noone;

// Distance used to show and hide alert
buffer = room_width * 0.25;

// Rates for fading in and out
fade_in_rate = 0.1;
fade_out_rate = 0.15;

// Checks if the alert sound already exists
if (!variable_global_exists("alert_sound"))
{
	// Plays the alert sound
	global.alert_sound = audio_play_sound(snd_incoming_alert, 100, true, image_alpha);
}
else
{
	// Check if the audio is playing
	if (audio_is_playing(global.alert_sound))
	{
		// Creates a variable to store the gain level
		var _max_volume = image_alpha;
		
		// Checks through all the alerts
		with (obj_alert)
		{
			// Checks if the alert is more visible
			if (image_alpha >= _max_volume)
			{
				// Sets the gain to image alpha
				_max_volume = image_alpha;
			}
		}
		
		// Sets the sound gain
		audio_sound_gain(global.alert_sound, _max_volume, 0);
	}
	else
	{
		// Plays the alert sound
		global.alert_sound = audio_play_sound(snd_incoming_alert, 100, true, image_alpha);
	}
}