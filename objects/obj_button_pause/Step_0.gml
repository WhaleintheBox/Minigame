// Checks the game is playing
if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{
	// Temp variable for gamepad press check
	var _gamepad_pause = false;
	
	// Checks gamepad 0 (player 1) connected
	if (gamepad_is_connected(0))
	{
		// Check start button
		if (gamepad_button_check_pressed(0, gp_start))
		{
			// Set press to true
			_gamepad_pause = true;	
		}
	}
	
	// Checks for press from keyboard or gamepad press and wasnt just paused
	if ((keyboard_check_pressed(vk_escape) || _gamepad_pause) && !was_paused)
	{
		// Sets hovered and pushed states to false
		is_hovered = false;
		is_pushed = false;
	
		// Sets target scale
		target_scale = 1.0;
		// Calls target function
		target_function();
		
		// Sets was paused state to true
		was_paused = true;
	}
	else
	{
		// Unsets was paused state
		was_paused = false;	
	}
}

// Inherit the parent event
event_inherited();