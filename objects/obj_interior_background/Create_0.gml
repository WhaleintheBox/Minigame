// Enum state for the interior states used
enum INTERIOR_STATE
{
	OUTSIDE,
	ENTER,
	INSIDE,
	EXIT,
	SIZE
}

// Sets the inital interior state to outside
current_interior_state = INTERIOR_STATE.OUTSIDE;

// Sets all the environment wall, ground, pipe states to outside
current_wall_state = INTERIOR_STATE.OUTSIDE;
current_ground_state = INTERIOR_STATE.OUTSIDE;
current_pipe_state = INTERIOR_STATE.OUTSIDE;

// Sets state for knowing when a wall has changed
has_wall_changed = false;

// Count for how many walls can exist
wall_segment_count = 3;

// Stores the walls sprites within an array
wall_sprite[0] = spr_wall_1;
wall_sprite[1] = spr_wall_2;
wall_sprite[2] = spr_wall_3;
wall_sprite[3] = spr_wall_start;
wall_sprite[4] = spr_wall_end;

// Prefetches the sprite array to load into system resources (prevents potential hanging when they are changed later)
sprite_prefetch_multi(wall_sprite);

// Creates an array for the set wall sprites to exist in
set_wall_sprites = array_create(wall_segment_count, -1);
// Creates an array of wall coordinates
wall_x_coords = array_create(wall_segment_count, 0);

// Sets the y coordinate to 0
wall_y_coords = 0;

// Sets the count for how many pipe segements will exist
pipe_segment_count = 3;

// Fills an array for all the pipe sprites 
pipe_sprite[0] = spr_pipe_start;
pipe_sprite[1] = spr_pipe_mid;
pipe_sprite[2] = spr_pipe_end;

// Prefethes the sprite array (again prevents hanging)
sprite_prefetch_multi(pipe_sprite);

// Creates an array for the set sprites (what is drawn)
set_pipe_sprites = array_create(wall_segment_count, -1);
// Creates and array of pipe x coordinates
pipe_x_coords = array_create(wall_segment_count, 0);

// Creates the pipes y coordinate
pipe_y_coords = 0;

// Variable for the ground segment count (larger since these sprites are smaller so more are needed to fill the screen)
ground_segment_count = 5;

// Stores the sprites for the runways within an array
ground_sprite[0] = spr_runway_inside_start;
ground_sprite[1] = spr_runway_inside_mid;
ground_sprite[2] = spr_runway_inside_end;
ground_sprite[3] = spr_runway_outside_1;
ground_sprite[4] = spr_runway_outside_2;
ground_sprite[5] = spr_runway_outside_3;

// Prefetches all the ground sprites from the array (again preventing hanging later when needed for the first time)
sprite_prefetch_multi(ground_sprite);

// Array for seting the sprites drawn in
set_ground_sprites = array_create(ground_segment_count, -1);
// Array for the x coordinates positions
ground_x_coords = array_create(ground_segment_count, 0);

// Loops through the ground segments
for (var _i = 0; _i < ground_segment_count; _i++)
{	
	// Sets the sprite to follow a pattern (the last 3 from array drawn outside 1, outside 2, outside 3)
	set_ground_sprites[_i] = ground_sprite[3 + (_i % 3)];
	// Sets the sprites x coordinates
	ground_x_coords[_i] = 0 + 512 * _i;
}

// Sets the y coordinate
ground_y_coords = 610;

// Sets the backgrounds parallaxing move rate
background_move_rate = 1.0;

// Function for changing the interior state (swapping inside and outside environments and back again)
change_interior_state = function()
{
	// Checks what the current state is
	switch (current_interior_state)
	{
		// When inside
		case INTERIOR_STATE.INSIDE:
			// Will only trigger when all environments are in inside state
			if (current_wall_state == INTERIOR_STATE.INSIDE &&
				current_ground_state == INTERIOR_STATE.INSIDE &&
				current_pipe_state == INTERIOR_STATE.INSIDE)
			{
				// Enters exit state
				current_interior_state = INTERIOR_STATE.EXIT;
			}
		break;
		
		// When outside
		case INTERIOR_STATE.OUTSIDE:
			// Will only trigger when all environments are in outside state
			if (current_wall_state == INTERIOR_STATE.OUTSIDE &&
				current_ground_state == INTERIOR_STATE.OUTSIDE &&
				current_pipe_state == INTERIOR_STATE.OUTSIDE)
			{
				// Changes to enter state
				current_interior_state = INTERIOR_STATE.ENTER;
			}
		break;
	}
}

// Functions for setting flowers
// Each set is created for the ground sprite bounds but are varied
// Flower object is created at random bounds from the coordinates set
// Object is then given a pre determined sprite based on those bounds
flower_set_1 = function(_x, _y)
{
	var _flower_1 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 230), "Flowers", obj_flower);
	_flower_1.sprite_index = spr_flower_1;
	
	var _flower_2 = instance_create_layer(_x + random_range(12, 246), _y + random_range(220, 250), "Flowers", obj_flower);
	_flower_2.sprite_index = spr_flower_2;
}
flower_set_2 = function(_x, _y)
{
	var _flower_1 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 230), "Flowers", obj_flower);
	_flower_1.sprite_index = spr_flower_1;
	
	var _flower_3 = instance_create_layer(_x + random_range(12, 246), _y + random_range(200, 250), "Flowers", obj_flower);
	_flower_3.sprite_index = spr_flower_3;
}
flower_set_3 = function(_x, _y)
{
	var _flower_2 = instance_create_layer(_x + random_range(12, 246), _y + random_range(220, 250), "Flowers", obj_flower);
	_flower_2.sprite_index = spr_flower_2;	
	var _flower_3 = instance_create_layer(_x + random_range(268, 500), _y + random_range(200, 250), "Flowers", obj_flower);
	_flower_3.sprite_index = spr_flower_3;
}
flower_set_4 = function(_x, _y)
{
	var _flower_2 = instance_create_layer(_x + random_range(268, 500), _y + random_range(220, 250), "Flowers", obj_flower);
	_flower_2.sprite_index = spr_flower_2;	
	var _flower_3 = instance_create_layer(_x + random_range(12, 246), _y + random_range(200, 250), "Flowers", obj_flower);
	_flower_3.sprite_index = spr_flower_3;
}

// Loops through the ground segements
for (var _i = 0; _i < ground_segment_count; _i++)
{
	// Chooses a random flower set function
	var _handle = choose(flower_set_1, flower_set_2, flower_set_3, flower_set_4);
	// Calls the chosen set function with the custom coordinates
	_handle(ground_x_coords[_i], ground_y_coords);
}

// Tells the gamemanager that this object has prefetched since relies on many sprite resources so it is safe to start the game
obj_game_manager.has_prefetched = true;