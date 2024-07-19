// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the x position by the current speed value
	x -= obj_game_manager.current_speed * 1.0;

	// Checks if the flag needs to drop
	if (!has_dropped)
	{
		// Checks if the flag is still in air
		if (y < 950)
		{
			// Adds fall speed to flag
			fall_speed += 120 * delta_time * 0.000001;
		
			// Adjusts the y position
			y += fall_speed;
		
			// Checks the y position if is now grounded
			if (y > 950)
			{
				// Hard sets ground position
				y = 950;
			
				// Sets warping state to true
				is_warping = true;
				
				// Calls firework function since landed
				create_firework();
			
				// Sets up handle request to keep calling fireworks at random intervals repeating until stopped
				handle_request = call_later(random_range(90, 120), time_source_units_frames, create_firework, true);
				
				// Sets up smoke particle effect for landing smoke
				var _smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
				_smoke_particle.owner = self;
				_smoke_particle.set_particle(ps_flag_smoke, "StageShadowsEffects");
			
				// Sets has dropped flag to true
				has_dropped = true;
			}
		}
	}

	// Checks if flag is currently warping
	if (is_warping)
	{
		// Sets temp warp rate
		var _warp_rate = 1.2;
		// Adjusts the curve percent by the time passed and rate
		warp_curve_percent += delta_time * 0.000001 * _warp_rate;
	
		// Checks if the curve has finished
		if (warp_curve_percent > 1.0)
		{
			// Sets curve value to full (100%)
			warp_curve_percent = 1.0;
			// Stops warping state
			is_warping = false;
			// Resets text alpha for flag
			text_alpha = 0.0;
			
			// Creates function called gameover for triggering gameover
			var _new_gameover = function()
			{
				// Stops the music
				audio_stop_sound(global.music);
				
				// Plays game over sound effect and changes the global music to ambience
				audio_play_sound(snd_game_over_popup, 100, false, 1.0);
				global.music = audio_play_sound(snd_ambience, 100, true, 1.0);
				
				// Play game over sequence for menu UI
				var _gameover_seq = layer_sequence_create("GUI", 0, 0, seq_gameover);
			}
			
			// Creates a game over handle for calling the game over function after 60 frames
			var _go_handle = call_later(60, time_source_units_frames, _new_gameover, false);
		}
	
		// Calculates the adjusted value from the curve
		var _adjust_val = animcurve_channel_evaluate(warp_curve, warp_curve_percent);
		// Sets the y scale to follow this curve
		image_yscale = 1.0 + _adjust_val;
	}

	// Checks if the flag has been passed and a new highscore should occur
	if (!has_passed && obj_game_manager.current_distance > global.highscore)
	{	
		// Creates particle effect manager and sets up a confetti effect
		var _confetti_particle = instance_create_layer(x - 50, y - 20, "Stage", obj_particle_manager);
		_confetti_particle.owner = self;
		_confetti_particle.set_particle(ps_confetti, "StageShadowsEffects");
		_confetti_particle.set_offset(-50, -240);
	
		// Calls the firework function
		create_firework();
	
		// Sets has passed flag to true
		has_passed = true;
	}
	
	// Checks if cooldown has been adjusted to stop coins overlaying the flag to be passed
	if (!has_cooldown_adjusted)
	{
		// Calculates the x position when next segment
		if (x <= room_width * 2.33)
		{
			// Resets the spawn cooldown with space for the flags placement
			obj_spawn_manager.spawn_cooldown = (room_width * 0.66) / 60;
			
			// Checks all the coins within the room
			with (obj_pickup_coin)
			{
				// Checks if coin is after the spawn point (or just before the flag)
				if (x >= room_width * 2)
				{
					// Destroys the coin
					instance_destroy();	
				}
			}
			
			// Sets cooldown adjusted state to true
			has_cooldown_adjusted = true;	
		}
	}

	// Plays the animation for the flag
	image_speed = 1;	
}
else
{
	// Pauses the animation for the flag
	image_speed = 0;
}