// Checks the current game state is not paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the pick ups position at the games current speed
	x -= obj_game_manager.current_speed * 1.0;

	// Checks if the object has gone off screen to the left
	if (x < 0 - 169)
	{	
		// Destroys the pickup
		instance_destroy();
	}
	
	// Plays the sprites animation speed normally
	image_speed = 1;	
}
else
{
	// Pauses the animation speed if the game is paused
	image_speed = 0;
}