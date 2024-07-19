// Change logic depending on the current game state.
switch (obj_game_manager.current_game_state)
{
	// Logic for while the game is playing.
	case GAME_STATE.PLAYING:
		image_speed = 2.0 * clamp(obj_game_manager.current_speed_percentage, 0.25, 1.0);
	break;
		
	// Normal speed when dying
	case GAME_STATE.DYING:
		image_speed = 1.0;
	break;
	
	// Stopped animations when dead
	case GAME_STATE.ENDED:
		image_speed = 0.0;
	break;
	
	// Stopped animations when paused
	case GAME_STATE.PAUSED:
		image_speed = 0.0;
	break;
}

draw_self();