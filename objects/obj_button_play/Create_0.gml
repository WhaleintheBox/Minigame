// Inherited from parent event
event_inherited();

// Sets panel state to true to draw panel behind sprite
has_panel = true;

// Sets target function
target_function = function()
{
	// Plays start game button sound
	audio_play_sound(snd_start_game_button, 100, false, 1.0);
	
	// Sends player to main room (starts game)
	room_goto(rm_main);
}