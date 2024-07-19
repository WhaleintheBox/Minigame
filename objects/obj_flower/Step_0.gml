// Checks if the game has been paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the flowers x position along at the games current speed
	x -= obj_game_manager.current_speed * 1.0;

	// Checks if the coordinate moves beyond the left offscreen threshold
	if (x < 0 - 59)
	{	
		// Destroys the flower
		instance_destroy();
	}
}