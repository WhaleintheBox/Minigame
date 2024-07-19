// Checks the game is not curently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Calculates the target direction of where the coin symbol is on the score GUI
	var _target_direction = point_direction(x, y, obj_gui.x - 5, obj_gui.y + 50);
	// Calculates the difference in directions between the direction headed and the target
	var _dir_difference = angle_difference(_target_direction, direction);
	// Adjusts the direction slowly at a rate of the directional difference
	direction += _dir_difference * 0.1;
	
	// Adjust the current speed variable to slower value at a slow rate
	current_speed = lerp(current_speed, 10, 0.05);
	// Applies the adjusted speed the the speed variable for movement
	speed = current_speed;
	
	// Sets the sprite image angle to the new direction with the adjusted angles added
	image_angle = direction - image_adjust + 180;
	
	// Lerps the sprite variables to fade out and scale down
	image_alpha = lerp(image_alpha, 0, 0.005);
	image_xscale = lerp(image_xscale, 0, 0.01);
	image_yscale = lerp(image_yscale, 0, 0.01);
	
	// Checks if the image is no longer visible
	if (image_alpha <= 0.1)
	{
		// Destroys the image
		instance_destroy();	
	}
}
else
{
	// Sets the speed to zero if paused to stop movement
	speed = 0;
}