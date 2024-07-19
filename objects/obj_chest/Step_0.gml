// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the chest at the games current move speed
	x -= obj_game_manager.current_speed * 1.0;
	
	// Calls the create sparkle function
	create_sparkles();

	// Checks if the chest has gone off screen
	if (x < 0 - 169)
	{
		// Sets self as a temporary variable 
		var _chest = self;
		
		// Loops though the shadow objects within the room
		with (obj_shadow)
		{
			// Checks if the shadows owner matches the chest
			if (owner == _chest)
			{
				// Destroys the shadow as no longer needed
				instance_destroy();
			}
		}
		
		// Checks idle state is still active and not collected
		if (is_idle)
		{
			// Destroys the sequence associated
			layer_sequence_destroy(sequence_body.set_sequence);
			// Destroys the bodys sequence object
			instance_destroy(sequence_body);
			
			// Stops chest sound
			audio_stop_sound(chest_sound);
			
			// Destroys the chest as no longer needed
			instance_destroy();
		}
		
	}
}

// Checks chest is not collected
if (is_idle)
{	
	// Checks the game is playing
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{	
		// Checks if the chest is to the right of the player
		if (x > obj_player.x)
		{
			// Scales the gain by the distance between player and chest to the room width
			audio_sound_gain(chest_sound, 1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0), 0.0);
		}
		else
		{
			// Scales the gain by the distance between player and chest to a fraction of the room width
			audio_sound_gain(chest_sound,  1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0), 0.0);
		}
	}
	else
	{
		// Fades out the chest sounds
		audio_sound_gain(chest_sound, 0.0, 3000); 
	}
}