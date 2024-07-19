// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the pickup at the games current speed
	x -= obj_game_manager.current_speed * 1.0;

	// Checks if pickup has gone off screen to the left
	if (x < 0 - 169)
	{	
		// Destroys the pickup object
		instance_destroy();
	}
	
	// Sets the animation speed to playing when not paused
	image_speed = 1;	
}
else
{
	// Sets the animation speed to stop when game is paused
	image_speed = 0;
}