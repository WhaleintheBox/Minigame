// Checks if the object has an owner set
if (owner != noone)
{
	// Adjusts the coordinates to follow its owner
	x = owner.x;
	y = owner.y;
}

// Checks if a sequence has been set
if (set_sequence != -1)
{
	// Checks if the sequnece has finished
	if (layer_sequence_is_finished(set_sequence))
	{
		// Destroys the sequence
		layer_sequence_destroy(set_sequence);
		
		// Checks if the sequence has a death call
		if (has_death)
		{
			// Runs the death call
			stored_function();	
		}
		
		// Destroys this sequences manager object
		instance_destroy();
	}
	else
	{
		// Updates the sequence position to the objects
		layer_sequence_x(set_sequence, x);
		layer_sequence_y(set_sequence, y);
	}
}

// Checks if the game is paused
if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	// Pauses the sequence
	layer_sequence_pause(set_sequence);
}
else
{
	// Checks if the sequence is paused
	if (layer_sequence_is_paused(set_sequence))
	{
		// Resumes the sequenece
	    layer_sequence_play(set_sequence);
	}
}