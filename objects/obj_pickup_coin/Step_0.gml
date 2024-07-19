// Checks if the game is currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the coin objects left at the games current move speed
	x -= obj_game_manager.current_speed * 1.0;

	// Checks if the coins have gone offscreen
	if (x < 0 - 169)
	{	
		// Destroys the coins
		instance_destroy();
	}
	
	// Sets the animation speed to playing
	image_speed = 1;	
}
else
{
	// Pauses the animation speed
	image_speed = 0;
}
