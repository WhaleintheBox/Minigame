// Inherited from parent event
event_inherited();

// Sets panel state to true to draw panel behind sprite
has_panel = true;

// Sets target function
target_function = function()
{
	// Plays button sound
	audio_play_sound(snd_button, 100, false, 1.0);
	
	// Checks if the game is able to quit on the current platform
	if (os_type == os_android || os_type == os_windows || os_type == os_macosx || os_type == os_linux)
	{
		// End the current game
		game_end();
	}
	else
	{
		// Restarts the current game as calling game end might cause issue on platform
		game_restart();	
	}
}