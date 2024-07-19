// Checks if the game is currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Checks what state the game should be
	switch(current_interior_state)
	{
		// When entering
		case INTERIOR_STATE.ENTER:
			// Sets walls and pipes to enter and pushes overall state to inside
			current_wall_state = INTERIOR_STATE.ENTER;
			current_pipe_state = INTERIOR_STATE.ENTER;
			current_interior_state = INTERIOR_STATE.INSIDE;
			break;
		// When exiting
		case INTERIOR_STATE.EXIT:
			// Sets a flag for the walls to change and its state to exit
			has_wall_changed = true;
			current_wall_state = INTERIOR_STATE.EXIT;
			// Pushes overall state to outside
			current_interior_state = INTERIOR_STATE.OUTSIDE;
			break;
	}
	
	// Loops through all wall segments
	for (var _i = 0; _i < wall_segment_count; _i++)
	{
		// Changes the x positions based on speed and parallaxing rate
		wall_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate;
	}

	// Loops through all the wall segements again
	for (var _i = 0; _i < wall_segment_count; _i++)
	{	
		// Creates a value to store width of the walls
		var _width = 0;
	
		// Checks sprite exists
		if (set_wall_sprites[_i] != -1)
		{
			// Sets value to sprites width (Not always the same)
			_width = sprite_get_width(set_wall_sprites[_i]);
		}
	
		// Checks if the current wall is offscreen
		if (wall_x_coords[_i] < -_width)
		{
			// Checks the walls current state
			switch(current_wall_state)
			{
				// When entering
				case INTERIOR_STATE.ENTER:
					// Sets enter wall
					set_wall_sprites[_i] = wall_sprite[3];
					// Changes the wall state to inside
					current_wall_state = INTERIOR_STATE.INSIDE;
					// Changes the ground state to enter (so dirt path ends only when inside)
					current_ground_state = INTERIOR_STATE.ENTER;
					break;
				// When inside
				case INTERIOR_STATE.INSIDE:
					// Change sprite to a random interior wall
					set_wall_sprites[_i] = choose(wall_sprite[0], wall_sprite[1], wall_sprite[2]);
					break;
				// When exiting
				case INTERIOR_STATE.EXIT:
					// Sets the exit wall sprite
					set_wall_sprites[_i] = wall_sprite[4];
					// Changes the wall state
					current_wall_state = INTERIOR_STATE.OUTSIDE;
					break;
				// When outside
				case INTERIOR_STATE.OUTSIDE:
					// Checks the wall has changed
					if (has_wall_changed)
					{
						// Changes the ground state to exit
						current_ground_state = INTERIOR_STATE.EXIT;
						// Changes wall has changed state flag back to false
						has_wall_changed = false;
					}
					// Unsets sprite since the are walls outside
					set_wall_sprites[_i] = -1;
					break;
			}
		
			// Creates minimum room width variable (used to set where the final x position should be when placed)
			var _min_x = room_width;
			
			// Loops all the wall segements again
			for (var _j = 0; _j < wall_segment_count; _j++)
			{
				// Checks the wall segment isnt the same and has been set
				if (_i != _j && set_wall_sprites[_j] != -1)
				{
					// Sets the wall segment to the highest value (itself or the other sprite coordinate plus its width
					_min_x = max(_min_x, wall_x_coords[_j] + sprite_get_width(set_wall_sprites[_j]));
				}
			}
			
			// Sets the new x position
			wall_x_coords[_i] = _min_x;
		}
	}

	// Loops through all the pipe segments
	for (var _i = 0; _i < pipe_segment_count; _i++)
	{
		// Moves their x coordinates by speed and parallaxing rate
		pipe_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate;
	}

	// Loops through all the pipes again now their positions have been changed
	for (var _i = 0; _i < pipe_segment_count; _i++)
	{	
		// Sets a width variable
		var _width = 0;
	
		// Checks the pipe sprite exists
		if (set_pipe_sprites[_i] != -1)
		{
			// Sets the width to the sprite width
			_width = sprite_get_width(set_pipe_sprites[_i]);
		}
	
		// Checks if the pipe is now off screen
		if (pipe_x_coords[_i] < -_width)
		{
			// Check what state pipes are currently
			switch(current_pipe_state)
			{
				// When enter
				case INTERIOR_STATE.ENTER:
					// Set enter sprite
					set_pipe_sprites[_i] = pipe_sprite[0];
					// Change state to inside
					current_pipe_state = INTERIOR_STATE.INSIDE;
					break;
				// When inside
				case INTERIOR_STATE.INSIDE:
					// Set to inside sprite
					set_pipe_sprites[_i] = pipe_sprite[1];
					break;
				// When exit
				case INTERIOR_STATE.EXIT:
					// Set to exit sprite
					set_pipe_sprites[_i] = pipe_sprite[2];
					// Change state to outside
					current_pipe_state = INTERIOR_STATE.OUTSIDE;
					break;
				// When outside
				case INTERIOR_STATE.OUTSIDE:
					// Unset sprite since no pipes when outside
					set_pipe_sprites[_i] = -1;
					break;
			}
			
			// Variable for minimum x spawn position
			var _min_x = room_width;
		
			// Loop through the pipe segments again
			for (var _j = 0; _j < pipe_segment_count; _j++)
			{
				// Check pipes are not the same and has been set
				if (_i != _j && set_pipe_sprites[_j] != -1)
				{
					// Adjust the minimum x coordinate possible again checking for the highest value of itself or the other cordinate and width
					_min_x = max(_min_x, pipe_x_coords[_j] + sprite_get_width(set_pipe_sprites[_j]));
				}
			}
			
			// Sets the pipes new x position
			pipe_x_coords[_i] = _min_x;
		}
	}

	// Loop throught the ground segments
	for (var _i = 0; _i < ground_segment_count; _i++)
	{
		// Adjust the positions by the speed and parallaxing rate
		ground_x_coords[_i] -= obj_game_manager.current_speed * background_move_rate;
	}

	// Loops throught the group segements again not they have moved
	for (var _i = 0; _i < ground_segment_count; _i++)
	{		
		// Check if the segement is off screen to the left
		if (ground_x_coords[_i] < -512)
		{
			// Check what the current ground state is
			switch(current_ground_state)
			{
				// When entering
				case INTERIOR_STATE.ENTER:
					// Set ground sprite to enter
					set_ground_sprites[_i] = ground_sprite[0];
					// Change state to inside
					current_ground_state = INTERIOR_STATE.INSIDE;
					break;
				// When inside
				case INTERIOR_STATE.INSIDE:
					// Change sprite to inside sprite
					set_ground_sprites[_i] = ground_sprite[1];
					break;
				// When exit
				case INTERIOR_STATE.EXIT:
					// Set ground to exit
					set_ground_sprites[_i] = ground_sprite[2];
					// Sets state to outside
					current_ground_state = INTERIOR_STATE.OUTSIDE;
					// Also sets the pipe to exit since the ground is changing
					current_pipe_state = INTERIOR_STATE.EXIT;
					break;
				// When outside
				case INTERIOR_STATE.OUTSIDE:
					// Sets the ground sprite to outside in the pattern it follows (last 3 in array in order looping)
					set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];
					// Sets a random flower create function
					var _handle = choose(flower_set_1, flower_set_2, flower_set_3, flower_set_4);
					// Calls the chosen function for making flowers at new location
					_handle(ground_x_coords[_i] + 512 * ground_segment_count, ground_y_coords);
					break;
			}
		
			// Sets new x position for ground sprite
			ground_x_coords[_i] += 512 * ground_segment_count;
		}
	}
}