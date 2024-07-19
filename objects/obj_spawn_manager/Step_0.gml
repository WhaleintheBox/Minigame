// Checks game is in play mode
if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{	
	// Set delta time for movements that are time based.
	var _delta_time = delta_time * 0.000001;
	
	// Calculate the change in distance
	var _delta_distance = obj_game_manager.current_speed * _delta_time;
	
	// Apply values to cooldowns
	powerup_cooldown -= _delta_distance;
	spawn_cooldown -= _delta_distance;
	enemy_cooldown -= _delta_distance;
	
	// Check is spawn cooldown is finished
	if (spawn_cooldown <= 0)
	{
		// Check if enemy can spawn (prioirty)
		if (enemy_cooldown <= 0)
		{
			// Calls the spawn enemy function
			spawn_enemy();
		}
		// Checks if powerup can be called
		else if (powerup_cooldown <= 0)
		{
			// Calls the spawn powerup option
			spawn_powerup();
		}
		else
		{
			// Spawns a random reward with the chance changing depending on how many times it is uses in this function
			spawn_reward(choose(0,1,1,1,1,2,2,2,3,3,4,4,5,4,6,7));
		}
	}	
}