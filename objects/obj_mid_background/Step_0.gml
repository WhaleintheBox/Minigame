// Checks the game is not paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves position at the speed and rate
	x -= obj_game_manager.current_speed * background_move_rate;

	// Checks if the x position has gone off screen to the left
	if (x < 0)
	{
		// Sets the sprites to the next one along
		before_sprite = sprite_index;
		sprite_index = after_sprite;
	
		// Checks what the last after sprite used was and swaps the sprite to the next one along following the pattern
		switch(after_sprite)
		{
			case sprite[0]:
				after_sprite = sprite[1];
				break;
			case sprite[1]:
				after_sprite = sprite[2];
				break;
			case sprite[2]:
				after_sprite = sprite[3];
				break;
			case sprite[3]:
				after_sprite = sprite[0];
				break;
		}
	
		// Moves the x coordinate along by its width
		x += sprite_width;
	}
}