// Checks if the game is currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Loops through the current fauna
	for (var _i = 0; _i < fauna_count; _i++)
	{
		// Moves the x position by the speed and set rate
		x_coords[_i] -= obj_game_manager.current_speed * move_rate;

		// Checks if the fauna has left the left of the screen
		if (x_coords[_i] + sprite_get_width(set_sprites[_i]) < 0)
		{
			// Sets the sprite (Array and choose function used since you may want to add more vines later!)
			//set_sprites[_i] = choose(sprite[0]);
			set_sprites[_i] = sprite[0];
		
			// Sets the temp variables
			var _pos_set = false;
			var _attempts = 0;
	
			// Checks if not set
			while (!_pos_set)
			{
				// Sets the x position with offset based on attempts
				x_coords[_i] = room_width + sprite_get_width(set_sprites[_i]) + room_width * (1 + 1 * _attempts);
				
				// Changes the set temp values
				_pos_set = true;
				_attempts++;
		
				// Loops through the fauna
				for (var _j = 0; _j < fauna_count; _j++)
				{
					// Checks new fauna dosen't match one being set
					if (_i != _j)
					{
						// Calculates if the spites would be intersecting
						if (x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
						{
							// Unsets the position
							_pos_set = false;	
						}
					}
				}
			}
		}
	
		// Checks if the x postion is greater than the rooms width (aka offscreen)
		if (x_coords[_i] > room_width)
		{	
			// Checks if the level is currently inside or out
			if (obj_interior_background.current_pipe_state == INTERIOR_STATE.OUTSIDE)
			{
				// Shows the vines if outside
				set_alphas[_i] = 1.0;	
			}
			else
			{
				// Hides the vines if inside
				set_alphas[_i] = 0.0;	
			}
		}
	}
}