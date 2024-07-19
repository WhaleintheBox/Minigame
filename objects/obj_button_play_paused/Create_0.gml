// Sets was paused state since just created
was_paused = true;

// Inherited from parent event
event_inherited();

// Sets panel state to true to draw panel behind sprite
has_panel = true;

// Sets target function
target_function = function()
{
	// Plays button sound
	audio_play_sound(snd_button, 100, false, 1.0);
	
	// Sets the state back to player
	obj_game_manager.current_game_state = GAME_STATE.PLAYING;
	
	// Destroys the paused menu banner
	instance_destroy(obj_banner_paused);
}