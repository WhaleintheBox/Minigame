// Creates a random angle plus or minus 30 degrees to move the gui coin in for variation
image_adjust = random_range(-30, 30);
// Sets the direction to head left with the added variation
direction = 180 + image_adjust;

// Sets the gui coins current speed to the games current speed
current_speed = obj_game_manager.current_speed;
// Applies this variable to the speed variable for movement updates
speed = current_speed;

// Sets the sprite to be visible
image_alpha = 1;

// Sets the sprite to be at full scale
image_xscale = 1;
image_yscale = 1;

// Sets an empty child particle variable, this is set when the instance is created 
child_particle = noone;

// Adds gold to the game managers totals
obj_game_manager.current_gold++;
obj_game_manager.current_level_gold++;
