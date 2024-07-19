//// Spawn Manager Object.
// This object is used to control spawning objects when needed.

// Cooldown variables
spawn_cooldown = 0;
powerup_cooldown = 50;
enemy_cooldown = 100;

// Spawns random enemy
spawn_enemy = function()
{
	// Sets the x position enemy will be spawned on
	var _spawn_x = room_width * 2;
	// Randomised value of what type of enemy will spawn
	var _type = irandom(2);
	
	// Switch statement of available types
	// Creates new enemy and updates cooldown based on distance needed 
	switch (_type)
	{
		case 0: // Beam high
			instance_create_layer(_spawn_x + 59, 230, "Stage", obj_beam);
			spawn_cooldown = 10 + 1.8;
		break;
		
		case 1: // Beam low
			instance_create_layer(_spawn_x + 59, 720, "Stage", obj_beam);
			spawn_cooldown = 10 + 1.8;
		break;
			
		case 2: // Normal enemy
			instance_create_layer(_spawn_x + 204, 800, "Stage", obj_enemy);
			spawn_cooldown = 0;
		break;
	}

	// Sets the enemy cooldown to a value between 200 and 75 calulated on the current level (More enemies the more gold collected)
	enemy_cooldown = 250 - (50 * clamp((obj_game_manager.current_level / 2), 1, 3.5));
}

// Spawns random powerup
spawn_powerup = function()
{
	// Sets the x and y coordinates for powerup drop
	// Y values are preset and chosen at random
	var _spawn_x = room_width * 2;
	var _new_y = choose(140, 315, 490, 665, 840);
	
	// Creates instance choosing a random type
	instance_create_layer(_spawn_x + 92, _new_y, "Stage", choose(obj_pickup_boost, obj_pickup_shield));
	
	// Resets spawn cooldown accounting for offset
	spawn_cooldown = 10 + 1.7;
	
	// Resets powerup cooldown adjusting for player level (less powerups late game)
	powerup_cooldown = 100 * min(obj_game_manager.current_level, 5);
}

// Function for spawning a preset reward
spawn_reward = function(_reward_type)
{
	// Sets up new spawn coordinates with preset x value and random y initially
	var _spawn_x = room_width * 2;
	var _new_x = _spawn_x + 34;
	var _new_y = random_range(100, 896);
	
	// Switch statement for reward types
	switch(_reward_type)
	{
		case 0: // Single Coin
		
			// New y value (ground level)
			_new_y = 896;
			
			// Creates instance at coordinates
			instance_create_layer(_new_x, _new_y, "Stage", obj_pickup_coin);
			// Sets the spawn cooldown for offsets
			spawn_cooldown = 10 + 1;
			
		break;
		
		case 1: // 3x3 Set Coins
			
			// Sets y position at random from preset coordinates
			_new_y = choose(100, 438, 776);
			
			// Loops horizontally for 3
			for (var _i = 0; _i < 3; _i++)
			{
				// Loops vertically for 3
				for (var _j = 0; _j < 3; _j++)
				{
					// Creates coin object at new positions
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			// Sets the cooldown for spawn gap with added value for horizontal length of segment
			spawn_cooldown = 10 + 3.2;
			
		break;
		
		case 2: // 9x2 Set Coins
			
			// Sets new y position at random from preset values
			_new_y = choose(100, 340, 580, 820)
			
			// Loops horizontally for 9
			for (var _i = 0; _i < 9; _i++)
			{
				// Loops vertically for 2
				for (var _j = 0; _j < 2; _j++)
				{
					// Creates new object at determined position
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			// Sets the cooldown for spawn gap with added value for horizontal length of segment
			spawn_cooldown = 10 + 9.9;
			
		break;
		
		case 3: // 2x9 Set Coins
		
			// Sets new y position
			_new_y = 180;
			
			// Loops horizontally for 2
			for (var _i = 0; _i < 2; _i++)
			{
				// Loops vertically for 9
				for (var _j = 0; _j < 9; _j++)
				{
					// Creates new coin object at set coordinates
					instance_create_layer(_new_x + _i * 70, _new_y + _j * 80, "Stage", obj_pickup_coin);
				}
			}
			
			// Sets the cooldown for spawn gap with added value for horizontal length of segment
			spawn_cooldown = 10 + 2.1;
			
		break;
		
		case 4: // 9x1 Wave Coins up curve
		
			// Sets y position at random from preset positions
			_new_y = choose(300, 550, 800);
			
			// Loops horizontally for 9
			for (var _i = 0; _i < 9; _i++)
			{
				// Calculates position spacing using sin curve and creates instance of object
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			// Sets the cooldown for spawn gap with added value for horizontal length of segment
			spawn_cooldown = 10 + 9.9;
			
		break;
		
		case 5: // 9x1 Wave Coins down curve
			
			// Picks y coordinate from 2 preset positions
			_new_y = choose(350, 600);
			
			// Loops horizonally for 9
			for (var _i = 0; _i < 9; _i++)
			{
				// Calculates position spacing using sin curve and creates instance of object
				instance_create_layer(_new_x + _i * 70, _new_y + sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			// Sets the cooldown for spawn gap with added value for horizontal length of segment
			spawn_cooldown = 10 + 9.9;
			
		break;
		
		case 6: // 17x2 Wave Coins twin curves
			
			// Sets middle y position
			_new_y = 500;
			
			// First loops one curve
			for (var _i = 0; _i < 17; _i++)
			{
				// Places objects with sin curve
				instance_create_layer(_new_x + _i * 70, _new_y + sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			// Loops second curve
			for (var _i = 0; _i < 17; _i++)
			{
				// Places objects with sin curve
				instance_create_layer(_new_x + _i * 70, _new_y - sin(pi / (8 / _i)) * 160, "Stage", obj_pickup_coin);
			}
			
			// Sets the cooldown for spawn gap with added value for horizontal length of segment
			spawn_cooldown = 10 + 18.9;
			
		break;
		
		case 7: // Chest
			
			// Sets new position for spawn coordinates (Ground Level)
			_new_x = _spawn_x + 206;
			_new_y = 896;
			
			// Creates new chest
			instance_create_layer(_new_x, _new_y, "Stage", obj_chest);
			
			// Sets the cooldown for spawn gap with added value for chest segment length
			spawn_cooldown = 10 + 3.7;
		break;
	}
}