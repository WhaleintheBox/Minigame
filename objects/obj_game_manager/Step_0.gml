// Set delta time for movements that are time based.
var _delta_time = delta_time * 0.000001;

// Checks if prefetch flag has not been met
if (!has_prefetched)
{
	// Sets delta time back to zero as game is still loading certain objects
	_delta_time = 0;	
}

// Change logic depending on the current game state.
switch (current_game_state)
{	
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
	
		// Calls the update speed function passing though the delta time parameter
		update_speed(_delta_time);
		
		// Decreases the background cooldown timer by the current speed and time passed
		background_cooldown -= current_speed * _delta_time;
		
		// Checks if the background cooldown has finished
		if (background_cooldown <= 0)
		{
			// Calls the change state function for the backgrounds
			obj_interior_background.change_interior_state();
			// Resets the cooldown to a random value increasing the higher cap by the current level since faster speeds may mean backgrounds apear for less time
			background_cooldown = random_range(100, 100 + 50 * current_level);
		}
		
	break;
	
	// Logic for when the player is dying
	case GAME_STATE.DYING:
		
		// Calls the update speed function
		update_speed(_delta_time);
		
		// Checks if the speed is currently zero and the player is now insvisible
		if (current_speed == 0 && obj_player.image_alpha == 0)
		{
			// Sets the games current state to end
			current_game_state = GAME_STATE.ENDED;
			
			// Checks if the current distance has passed the previously set high score
			if (current_distance > global.highscore)
			{
				// Makes a new flag over the players position that will drop into the level and has its distance set
				var _flag = instance_create_layer(obj_player.x, -200, "Stage", obj_flag_marker);
				_flag.has_dropped = false;
				_flag.has_passed = true;
				_flag.flag_distance = current_distance;
				
				// Sets the global highscore variable to the current distance
				global.highscore = current_distance;
				
				// Loads buffer for highscore
				highscore_buffer = buffer_load("ENDLESS_RUNNER_HS.sav");
	
				// Checks if buffer exists
				if(!buffer_exists(highscore_buffer))
				{
					// Creates highscore buffer
					highscore_buffer = buffer_create(16384, buffer_fixed, 2);
				}
		
				// Goes to the start of the buffer
				buffer_seek(highscore_buffer, buffer_seek_start, 0);

				// Writes highscore value to the buffer
				buffer_write(highscore_buffer, buffer_u64, global.highscore);
	
				// Saves the new highscore buffer
				buffer_save(highscore_buffer, "ENDLESS_RUNNER_HS.sav");
			}
			else
			{
				// Stops the current music
				audio_stop_sound(global.music);
				
				// Plays game over sound effect and changes the global music to ambience
				audio_play_sound(snd_game_over_popup, 100, false, 1.0);
				global.music = audio_play_sound(snd_ambience, 100, true, 1.0);
				
				// Plays the game over sequence that creates the gameover menu
				var _gameover_seq = layer_sequence_create("GUI", 0, 0, seq_gameover);
			}
		}
	break;
}

