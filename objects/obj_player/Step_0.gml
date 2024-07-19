// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Set delta time for movements that are time based.
	var _delta_time = delta_time * 0.000001;

	// Change logic depending on the current game state.
	switch (obj_game_manager.current_game_state)
	{	
		// Logic for while the game is playing.
		case GAME_STATE.PLAYING:
			
			// Sets up temp variable for gamepad jump state
			var _gamepad_jump = false;
			
			// Checks when gamepad with id 0 (player 1) is connected
			if (gamepad_is_connected(0))
			{
				// Checks for jump button press
				if (gamepad_button_check(0, gp_face1))
				{
					// Sets variable to true
					_gamepad_jump = true;	
				}
			}
	
			// Checks for jump inputs
			if (keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump)
			{
				// Sets has jumped state to true
				has_jumped = true;
				// Addes jump values to y velocity
				y_velo += jump_strength * _delta_time;
			
				// Checks the player is curretly running
				if (current_player_state == PLAYER_STATE.RUN)
				{
					// Sets the player to idle state
					current_player_state = PLAYER_STATE.IDLE;
					// Changes the sprite and image index
					sprite_index = spr_character_idle;
					image_index = 0;
					
					// Creates and sets up particle object for initial jump flame
					var _new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
					_new_flame_particle.set_particle(ps_inital_jump_flame, "StageBackEffects");
					_new_flame_particle.set_offset(0, 100);
					_new_flame_particle.move_rate = 0;
					_new_flame_particle.drag_rate = 0.05;
					
					// Creates and sets up particle effect for initial jump dust cloud effect
					var _dust_particle = instance_create_layer(x, y + 80, "Stage", obj_particle_manager);
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.05;
				}
				// Checks if the y velocity is greater than the jump threshold (Stronger jump effect)
				else if (y_velo > jump_threshold)
				{
					// Sets the state to fly big
					current_player_state = PLAYER_STATE.FLY_BIG;
					// Resets the player sprite
					sprite_index = spr_character_idle;
				}
				else
				{
					// Sets the state to fly small
					current_player_state = PLAYER_STATE.FLY_SMALL;
					// Resets the player sprite
					sprite_index = spr_character_idle;
				}
			}
			// Checks if the player is in air
			else if (y < ystart)
			{
				// Sets the state to released (falling)
				current_player_state = PLAYER_STATE.FLY_RELEASED;
				// Resets the player sprite
				sprite_index = spr_character_idle;
			}
		
			// Checks if the player is boosting
			if (is_boosting)
			{
				// Sets the games target speed to 100%
				obj_game_manager.target_speed_percentage = 1.0;
				// Reduces booster cooldown
				boost_cooldown -= _delta_time;
			
				// Checks if cooldown has expired
				if (boost_cooldown <= 0)
				{
					// Creates particle effect object for booster off effect
					var _new_aura_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
					_new_aura_particle.owner = self;
					_new_aura_particle.set_particle(ps_powerup_out, "StageFrontEffects");
					
					// Sets boosting state to false
					is_boosting = false;
					// Resets the cooldown
					boost_cooldown = 0;
				}
			}
			else
			{
				// Sets the target spped to 50% (Normal speed)
				obj_game_manager.target_speed_percentage = 0.5;
			}
	
			break;
		
		case GAME_STATE.DYING:
	
			// Checks if the player hasnt already died
			if (current_player_state != PLAYER_STATE.DEATH)
			{
				// Sets the player to dead
				current_player_state = PLAYER_STATE.DEATH;
				// Changes the sprite
				sprite_index = spr_character_death;
				// Resets the image index
				image_index = 0;
				// Sets the target speed to 0 and stop
				obj_game_manager.target_speed_percentage = 0.0;
			}
	
			break;
		
		case GAME_STATE.ENDED:
			// Do nothing
		break;
		
		case GAME_STATE.PAUSED:
			// Do nothing
		break;
		
		case GAME_STATE.TUTORIAL:
		
			// Checks if player can jump in tutorial yet
			if (!obj_tutorial.can_jump)
			{
				// Checks if the player is falling
				if (y < ystart)
				{
					// Sets player to relased state
					current_player_state = PLAYER_STATE.FLY_RELEASED;
					// Resets the player sprite
					sprite_index = spr_character_idle;
				}
				
				break;
			}
			
			// Sets up temp jump check for tutorial gamepad controls
			var _gamepad_jump_tutorial = false;
			
			// Check gamepad 0 (player 1) is connected
			if (gamepad_is_connected(0))
			{
				// Check for jump button press
				if (gamepad_button_check(0, gp_face1))
				{
					// Set state for temp variable to true
					_gamepad_jump_tutorial = true;	
				}
			}
	
			// Check if keyboard, mouse or gamepad has jumped
			if (keyboard_check_direct(vk_space) || mouse_check_button(mb_left) || _gamepad_jump_tutorial)
			{
				// Set has jumped variable to true
				has_jumped = true;
				
				// Add jump strenght to y velosity
				y_velo += jump_strength * _delta_time;
			
				// Check if player is running
				if (current_player_state == PLAYER_STATE.RUN)
				{
					// Set their state to idle
					current_player_state = PLAYER_STATE.IDLE;
					
					// Resets the player sprite
					sprite_index = spr_character_idle;
					image_index = 0;
					
					// Creates and sets up particle object for initial jump flame
					var _new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
					_new_flame_particle.set_particle(ps_inital_jump_flame, "StageBackEffects");
					_new_flame_particle.set_offset(0, 100);
					_new_flame_particle.move_rate = 0;
					_new_flame_particle.drag_rate = 0.05;
					
					
					// Creates and sets up particle effect for initial jump dust cloud effect
					var _dust_particle = instance_create_layer(x, y + 80, "Stage", obj_particle_manager);
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.05;
				}
				// Check if vertical jump velocity is greater than the threshold
				else if (y_velo > jump_threshold)
				{
					// Set player state to big jump
					current_player_state = PLAYER_STATE.FLY_BIG;
					// Resets the player sprite
					sprite_index = spr_character_idle;
				}
				else
				{
					// Set player state to small jump
					current_player_state = PLAYER_STATE.FLY_SMALL;
					// Resets the player sprite
					sprite_index = spr_character_idle;
				}
			}
			// Check if player is in air
			else if (y < ystart)
			{
				// Sets player state to released (falling)
				current_player_state = PLAYER_STATE.FLY_RELEASED;
				// Resets the player sprite
				sprite_index = spr_character_idle;
			}
			
		break;
	}

	// Checks the game is not currently paused
	if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
	{
		// Adjust velocity by gravity
		y_velo -= gravity_strength;

		// Adds the velocity to the y position
		y -= y_velo;

		// Checks if the player is under the ground level
		if (y > ystart)
		{
			// Set the players y position back to ground
			y = ystart;
			// Set the vertical speed to zero
			y_velo = 0.0;
			
			// Checks if the game is playing or in tutorial mode
			if (obj_game_manager.current_game_state == GAME_STATE.PLAYING || obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
			{
				// When the player isnt running
				if (current_player_state != PLAYER_STATE.RUN)
				{
					// Reset the player to run
					current_player_state = PLAYER_STATE.RUN;
					// Set player sprite to running sprite
					sprite_index = spr_character_run;
				}
		
				// If player has jumped and isnt boosting
				if (has_jumped && !is_boosting)
				{
					// Create a particle effect at the players feet for a dust effect (jump particle effect)
					var _dust_particle = instance_create_layer(x, y + 90, "Stage", obj_particle_manager);
					_dust_particle.set_particle(ps_dust_small, "StageFrontEffects");
					_dust_particle.move_rate = 0;
					_dust_particle.drag_rate = 0.01;
		
					// Set has jumped state back to false
					has_jumped = false;
				}
			}
		}
		// If the player is above the top of the screen
		else if (y < 0)
		{
			// Set the player to the top of the screen
			y = 0;
			// Clear their vertical velocity
			y_velo = 0.0;
		}

		// Checks if the game is playing and the player is boosting
		if (is_boosting && obj_game_manager.current_game_state == GAME_STATE.PLAYING)
		{
			// Change the player state to boosting
			current_player_state = PLAYER_STATE.BOOST;
			// Sets the plater sprite to the boosting sprite
			sprite_index = spr_character_boost;	
		}
	}
}