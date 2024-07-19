// Checks owner exists
if (owner != noone)
{
	// Checks owener is offscreen with added buffer distance
	if (owner.bbox_left > room_width + buffer)
	{
		// Will show alert
		target_alpha = 1;
	}
	// Checks if owner is closer than the buffer
	else if (owner.bbox_left > room_width)
	{
		// Scales down the target alpha between 0 and 1
		target_alpha = clamp(buffer / (room_width - owner.bbox_left), 0, 1);
	}
	else
	{
		// Sets the target alpha to 0 since owner on screen and should be invisible
		target_alpha = 0;
	}

	// Checks if the target is higher than the current alpha value
	if (target_alpha > image_alpha)
	{
		// Fades in at in rate
		image_alpha = lerp(image_alpha, target_alpha, fade_in_rate);
	}
	else
	{
		// Fades out at out rate
		image_alpha = lerp(image_alpha, target_alpha, fade_out_rate);
	}
	
	// Checks if game is playing
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
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
		// Fades out the alert sound
		audio_sound_gain(global.alert_sound, 0, 3000);
	}
	
	// Checks if both the target and current alpha is set to zero
	if (target_alpha == 0 && image_alpha == 0)
	{
		// Destroys the alert
		instance_destroy();	
	}
}
else
{
	// Destroys the alert since no owner exists
	instance_destroy();	
}

// Checks if game is paused
if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	// Stops animation
	image_speed = 0;	
}
else
{
	// Plays animation
	image_speed = 1;
}