// Inherited from parent event
event_inherited();

// Sets panel state to true to draw panel behind sprite
has_panel = true;

// Sets target function
target_function = function()
{
	// Plays button sound
	audio_play_sound(snd_start_game_button, 100, false, 1.0);
	
	// Restarts the room
	room_restart();
}