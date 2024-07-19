// Checks if the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves x position by current speed
	x -= obj_game_manager.current_speed * 1.0;
	
	// Moves the x postiion again by the walking speed
	x -= walking_speed;	

	// Checks if the enemy has gone off screen to the left
	if (x < 0 - 204)
	{	
		// Destroys the enemy
		instance_destroy();
	}
	
	// Sets the animation speed to play
	image_speed = 1;
	
	// Checks the for step frame and step hasnt played for the step
	if (!has_stepped && (round(image_index) == 4 || round(image_index) == 13))
	{
		// Chooses a random footstep
		var _footstep = choose(snd_dino_robot_footstep_1, snd_dino_robot_footstep_2, snd_dino_robot_footstep_3, snd_dino_robot_footstep_4, snd_dino_robot_footstep_5, snd_dino_robot_footstep_6);
		
		// Sets default gain
		var _gain = 1.0;
		
		// Checks if the dino is to the right of the player
		if (x > obj_player.x)
		{
			// Scales the gain by the distance between player and enemy to the room width
			_gain = 1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0);
		}
		else
		{
			// Scales the gain by the distance between player and enemy to a fraction of the room width
			_gain = 1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0);
		}
		
		// Plays the footstep sound
		audio_play_sound(_footstep, 100, false, _gain);
		
		// Sets step state to true
		has_stepped = true;
	}
	// Checks is not currently on a step frame
	else if (!(round(image_index) == 4 || round(image_index) == 13))
	{
		// Sets step state to false
		has_stepped = false;	
	}
}
else
{
	// Pauses the animation speed
	image_speed = 0;
}