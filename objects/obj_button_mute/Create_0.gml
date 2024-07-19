// Inherited from parent event
event_inherited();

// Sets panel state to true to draw panel behind sprite
has_panel = true;

// Checks if global variable for muted state exists
if (!variable_global_exists("is_muted"))
{
	// Sets state to false so it can be used
    global.is_muted = false;
}

// Checks muted state
if (global.is_muted)
{
	// Sets master gain to zero (no sounds at all)
	audio_master_gain(0);
	// Shows mute icon
	image_index = 1;
}
else
{
	// Sets master gain to one (all sounds play normally)
	audio_master_gain(1);
	// Shows sound icon
	image_index = 0;
}

// Sets target function for when pressed
target_function = function()
{
	// Plays button sound
	audio_play_sound(snd_button, 100, false, 1.0);
	
	// Swaps muted state
	global.is_muted = !global.is_muted;
	
	// Checks muted stare
	if (global.is_muted)
	{
		// Sets master gain to zero (no sounds at all)
		audio_master_gain(0);
		// Shows mute icon
		image_index = 1;
	}
	else
	{
		// Sets master gain to one (all sounds play normally)
		audio_master_gain(1);
		// Shows sound icon
		image_index = 0;
	}
}