// State for checking if the game was just paused
was_paused = false;

// Check global touch state for if touch controls
if (global.is_touch)
{
	// Set sprite to larger paused sprite
	sprite_index = spr_button_pause_mobile;
}

// Inherited from parent event
event_inherited();

// Sets target function
target_function = function()
{
	// Plays button sound
	audio_play_sound(snd_button, 100, false, 1.0);
	
	// Check if the game was playing
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		// Sets the game to paused
		obj_game_manager.current_game_state = GAME_STATE.PAUSED;
		
		// Play pause sequence for menu UI
		var _pause_seq = layer_sequence_create("GUI", 0, 0, seq_pause);
	}
}