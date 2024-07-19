// Checks the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Set the x position to move at the games current speed
	x -= obj_game_manager.current_speed;
	// Speeds up the fireworks rocket speed
	fire_speed *= 1.005;
	// Sets the speed to the new fire speed (done this was to retain the current value if paused)
	speed = fire_speed;
	
	// Adds time to the time alive
	life += delta_time * 0.000001;

	// Checks if the firework has been alive for longer than the delay attached so visually only appears after a set time
	if (life > delay)
	{
		// Creates a new particle effect for the trail
		create_ps(trail_ps);
	}

	// Checks if the firework has been alive long enough for its final explosion
	if (life > death)
	{
		// Creates the final particle effect for the explosions head
		create_ps(head_ps);
		
		// Chooses a random bang sound
		var _sfx_bang = choose(snd_firework_bang_1, snd_firework_bang_2, snd_firework_bang_3);
		// Plays firework bang sound 
		audio_play_sound(_sfx_bang, 100, false, 0.5);
		
		// Plays firework crackle sound
		var _sfx_crackle = audio_play_sound(snd_celebration_firework, 100, false, 0.5, 0.5, random_range(0.95, 1.05));
		audio_sound_set_track_position(_sfx_crackle, 5.0);
		
		// Destroys the firework object
		instance_destroy();	
	}
}
else
{
	// Pauses the move speed
	speed = 0;	
}