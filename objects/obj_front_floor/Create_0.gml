// Variable for how many bushes can exist at once
fauna_count = 5;

// Creates array for the x positions
x_coords = array_create(fauna_count, 0);
// Creates array for the sprites to be used
set_sprites = array_create(fauna_count, -1);
// Creates array for the alpha values (hide/show)
set_alphas = array_create(fauna_count, 1.0);

// Fill the sprite array with the sprites created
sprite[0] = spr_foreground_floor_1;
sprite[1] = spr_foreground_floor_2;
sprite[2] = spr_foreground_floor_3;
sprite[3] = spr_foreground_floor_4;

// Calls prefetch function to call the sprites into system resources
sprite_prefetch_multi(sprite);

// Loops through the array of bushes
for (var _i = 0; _i < fauna_count; _i++)
{
	// Sets bush up with random sprite
	set_sprites[_i] = choose(sprite[0], sprite[1], sprite[2], sprite[3]);
	
	// Creates temp variables for placement checking
	var _pos_set = false;
	var _attempts = 0;
	
	// Loops when not set
	while (!_pos_set)
	{
		// Sets at random coordinates with offset added for failed attempts
		x_coords[_i] = random_range(0, room_width * (2 + 1 * _attempts));
		
		// Changes the temp values
		_pos_set = true;
		_attempts++;
		
		// Loops through the existing bushes
		for (var _j = 0; _j < fauna_count; _j++)
		{
			// Checks bush is not the same
			if (_i != _j)
			{
				// Checks if the sprites are overlapping
				if (x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
				{
					// Changes flag to not set
					_pos_set = false;	
				}
			}
		}
	}
}

// Sets the y position to room height
y = room_height;
// Sets the move rate for parallaxing
move_rate = 1.1;