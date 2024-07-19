// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Loops through the bushes
	for (var _i = 0; _i < fauna_count; _i++)
	{
		// Moves the x positions based on the current speed and parallaxing move rate
		x_coords[_i] -= obj_game_manager.current_speed * move_rate;

		// Checks if the bush has left the left side of the screen
		if (x_coords[_i] + sprite_get_width(set_sprites[_i]) < 0)
		{	
			// Changes the bushes sprite
			set_sprites[_i] = choose(sprite[0], sprite[1], sprite[2], sprite[3]);
		
			// Creates temp values for placement checking
			var _pos_set = false;
			var _attempts = 0;
	
			// Loops when not set
			while (!_pos_set)
			{
				// Sets x position at random with attempt count adding to help hanging here
				x_coords[_i] = room_width + sprite_get_width(set_sprites[_i]) + random_range(0, room_width * (1 + 1 * _attempts));
				
				// Changes the values since now set
				_pos_set = true;
				_attempts++;
		
				// Loops through the bushes again
				for (var _j = 0; _j < fauna_count; _j++)
				{
					// Checks they are not the same
					if (_i != _j)
					{
						// Checks the sprites are not intersecting
						if (x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
						{
							// Unsets flag so loop will reattempt placement
							_pos_set = false;	
						}
					}
				}
			}
		
		}
	
		// Checks when bush hasnt entered room yet
		if (x_coords[_i] > room_width)
		{	
			// Checks if game is inside or outside
			if (obj_interior_background.current_ground_state == INTERIOR_STATE.OUTSIDE)
			{
				// Sets to visible bush since outside
				set_alphas[_i] = 1.0;	
			}
			else
			{
				// Hides bush since inside
				set_alphas[_i] = 0.0;	
			}
		}
	}
}