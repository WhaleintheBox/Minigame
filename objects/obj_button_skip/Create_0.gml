// Inherited from parent event
event_inherited();

// Sets panel state to true to draw panel behind sprite
has_panel = true;

// Sets target function
target_function = function()
{
	// Plays button sound
	audio_play_sound(snd_button, 100, false, 1.0);
	
	// Sets the tutorial object to tip type 4 (end tutorial)
	obj_tutorial.tip_type = 4;
}