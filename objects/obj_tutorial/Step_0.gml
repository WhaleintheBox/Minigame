// Checks if escape button pressed
if (keyboard_check_pressed(vk_escape))
{
	// Sets state to 4 skipping tutorial
	tip_type = 4;
	
	// Plays button sound
	audio_play_sound(snd_button, 100, false, 1.0);
}

// Checks if player 1 connected
if (gamepad_is_connected(0))
{
	// Checks for face button press
	if (gamepad_button_check_pressed(0, gp_face2))
	{
		// Sets state to 4 skipping tutorial
		tip_type = 4;
		
		// Plays button sound
		audio_play_sound(snd_button, 100, false, 1.0);
	}
}

// Checks state of tip type
switch (tip_type)
{
	// Tip 1 - Welcome / any button to continue
	case 0:
	
		// Sets target speed to 0 and pauses player animation
		obj_game_manager.target_speed_percentage = 0.0;
		obj_player.image_speed = 0;

		// Checks for input by any means and enables up pushing state into next mode
		if (is_gamepad && gamepad_button_check(0, gp_face1))
		{
			tip_type = 1;
			can_jump = true;
			
			// Plays tutorial sound
			audio_play_sound(snd_tutorial_text_popup, 100, false, 1.0);
		}		
		else if (global.is_touch && mouse_check_button(mb_left))
		{
			tip_type = 1;
			can_jump = true;
			
			// Plays tutorial sound
			audio_play_sound(snd_tutorial_text_popup, 100, false, 1.0);
		}
		else if (keyboard_check_direct(vk_anykey) || mouse_check_button(mb_left))
		{
			tip_type = 1;
			can_jump = true;
			
			// Plays tutorial sound
			audio_play_sound(snd_tutorial_text_popup, 100, false, 1.0);
		}
		
		break;
	
	// Tip 2 - jump
	case 1:
		
		// Sets player speed to slowly move (not full speed)
		obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.333;
		
		// Plays player animation at rate of speed
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		
		// Checks if gamepad
		if (is_gamepad)
		{
			// Check for the os type
			if (os_type ==  os_switch) // Switch
			{
				// Displays input message
				tip_message = "Use the B button\nor touch screen to jump!";
			}
			else if (os_type == os_ps4 || os_type == os_ps5) // PlayStation
			{
				// Displays input message
				tip_message = "Use the Cross button to jump!";
			}
			else if (os_type == os_gdk || os_type == os_xboxseriesxs) // Xbox
			{
				// Displays input message
				tip_message = "Use the A button to jump!";
			}
			else // Default gamepad message
			{
				// Displays input message
				tip_message = "Use the A or Cross button to jump!";
			}
			
			// Check for button input
			if (gamepad_button_check(0, gp_face1) || mouse_check_button(mb_left))
			{
				// Increment action timer
				action_timer += delta_time * 0.000001;
			}
		}
		// Checks if touch
		else if (global.is_touch)
		{
			// Displays input message
			tip_message = "Tap or hold the screen to jump!";
			
			// Check for input
			if (mouse_check_button(mb_left))
			{
				// Increment action timer
				action_timer += delta_time * 0.000001;
			}
		}
		else
		{
			// Displays input message
			tip_message = "Use space or the left mouse\nbutton to jump!";
			
			// Check for input
			if (mouse_check_button(mb_left) || keyboard_check_direct(vk_space))
			{
				// Increment action timer
				action_timer += delta_time * 0.000001;
			}
		}
		
		// Check if action timer has surpased threshold
		if (action_timer >= 1.5)
		{
			// Resets action timer
			action_timer = 0;
			// Moves onto next tip
			tip_type = 2;
			
			// Plays tutorial sound
			audio_play_sound(snd_tutorial_text_popup, 100, false, 1.0);
		}
		
		break;
	
	// Tip 3 - fall
	case 2:
		
		// Controls players speed and animations (slowed)
		obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.333;
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		
		// Check input types
		if (is_gamepad)
		{
			// Check for the os type
			if (os_type ==  os_switch) // Switch
			{				
				// Display correct message
				tip_message = "Release the B button and\ntouch screen to drop down!";
			}
			else if (os_type == os_ps4 || os_type == os_ps5) // PlayStation
			{
				// Display correct message
				tip_message = "Release the Cross button\nto drop down!";
			}
			else if (os_type == os_gdk || os_type == os_xboxseriesxs) // Xbox
			{	
				// Display correct message
				tip_message = "Release the A button\nto drop down!";
			}
			else // Default gamepad message
			{
				// Display correct message
				tip_message = "Release the A or Cross button\nto drop down!";
			}
			
			// Check input released
			if (!gamepad_button_check(0, gp_face1) && !mouse_check_button(mb_left))
			{
				// Increase action timer
				action_timer += delta_time * 0.000001;
			}
		}
		// Check input types
		else if (global.is_touch)
		{
			// Display correct message
			tip_message = "Release the screen to drop down!";
			
			// Check input released
			if (!mouse_check_button(mb_left))
			{
				// Increase action timer
				action_timer += delta_time * 0.000001;
			}
		}
		else
		{
			// Display correct message
			tip_message = "Release space and the left mouse\nbutton to drop down!";
			
			// Check input released
			if (!mouse_check_button(mb_left) && !keyboard_check_direct(vk_space))
			{
				// Increase action timer
				action_timer += delta_time * 0.000001;
			}
		}
		
		// Check action timer has passed threshold
		if (action_timer >= 1.5)
		{
			// Reset timer
			action_timer = 0;
			// Move onto next tip
			tip_type = 3;
			
			// Plays tutorial sound
			audio_play_sound(snd_tutorial_text_popup, 100, false, 1.0);
		}
		
		break;
	
	// Tip 4 - Good luck message
	case 3:
		
		// Keeps player speed and animations slowed
		obj_game_manager.update_speed(delta_time * 0.000001);
		obj_game_manager.target_speed_percentage = 0.333;
		obj_player.image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
		
		// Sets new final message
		tip_message = "Collect coins and avoid\nobstacles to see how far\nyou can get!\n\n GOOD LUCK!";
		
		// Increases timer
		action_timer += delta_time * 0.000001;
		
		// Checks if timer has finished
		if (action_timer >= 4.0)
		{
			// Resets timer
			action_timer = 0;
			// Moves onto final tip state
			tip_type = 4;
		}
		
		break;
	
	// Tip 5 - Clears tutorial
	case 4:
	
		// Sets game to playing
		obj_game_manager.current_game_state = GAME_STATE.PLAYING;
		
		// Stops tutorial sounds
		audio_stop_sound(global.music);
		// Plays the games main music at half volume
		global.music = audio_play_sound(snd_infinite_runner_music, 100, true, 0.5);
		
		// Creates gamemaker coin sequence to fill in deadspace
		layer_sequence_create("Stage", 0, 0, seq_gm_layout);
		
		// Checks if highscore has been set
		if (global.highscore != 0)
		{
			// Creates a flag at the highscores location setting its properties
			var _flag = instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker);
			_flag.has_dropped = true;
			_flag.flag_distance = global.highscore;
		}
		
		// Destroys the skip button
		instance_destroy(obj_button_skip);
		
		// Destroys this banner
		instance_destroy();
		break;
}