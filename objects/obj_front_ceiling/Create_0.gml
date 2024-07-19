// Keeps count of how many vines can be created
fauna_count = 2;

// Creates an empty array of x positions
x_coords = array_create(fauna_count, 0);
// Creates an empty array of unset sprites
set_sprites = array_create(fauna_count, -1);
// Creates an empty array of alpha values
set_alphas = array_create(fauna_count, 1.0);

// Sets the inital sprite in a sprite array to vine sprite
sprite[0] = spr_foreground_celing_1;

// Loops through the vines
for (var _i = 0; _i < fauna_count; _i++)
{
	// Sets the sprite (Array and choose function used since you may want to add more vines later!)
	//set_sprites[_i] = choose(sprite[0]);
	set_sprites[_i] = sprite[0];
	
	// Temp variables for checking if the position has been set and how many attempts have been made
	var _pos_set = false;
	var _attempts = 0;
	
	// Checks position hasnt been set
	while (!_pos_set)
	{
		// Sets position with added offset of attempts
		x_coords[_i] = random_range(0, room_width * (2 + 1 * _attempts));
		
		// Adjusts the temp variables
		_pos_set = true;
		_attempts++;
		
		// Loops through the existing vines
		for (var _j = 0; _j < fauna_count; _j++)
		{
			// Checks they are not the same as the current fauna being set
			if (_i != _j)
			{
				// Checks if the sprites would be overlapping
				if (x_coords[_i] + sprite_get_width(set_sprites[_i]) > x_coords[_j] && x_coords[_i] < x_coords[_j] + sprite_get_width(set_sprites[_j]))
				{
					// Changes the set flag to false
					_pos_set = false;	
				}
			}
		}
	}
}

// Sets the y position value to origin
y = 0;
// Sets default move rate
move_rate = 1.1;