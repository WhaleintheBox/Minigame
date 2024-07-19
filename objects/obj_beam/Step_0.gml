// Checks the game is not paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Moves the beam at the games current speed
	x -= obj_game_manager.current_speed * 1.0;

	// Creates a particle emitter manager object at top position and sets the beam effect for it
	var _beam_top_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_beam_top_particle.owner = self;
	_beam_top_particle.set_particle(ps_enemy_laser, "StageFrontEffects");
	_beam_top_particle.set_angle(180);
	_beam_top_particle.set_offset(0, -128);

	// Creates a particle emitter manager object at low position and sets the beam effect for it
	var _beam_bottom_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_beam_bottom_particle.owner = self;
	_beam_bottom_particle.set_particle(ps_enemy_laser, "StageFrontEffects");
	_beam_bottom_particle.set_angle(0);
	_beam_bottom_particle.set_offset(0, +128);

	// Checks if the beam has gone offscreen to the left
	if (x < 0 - 59)
	{	
		// Destroys the beam
		instance_destroy();
	}
	
	// Plays the animation normally
	image_speed = 1;
}
else
{
	// Pauses the animation
	image_speed = 0;	
}

// Checks the game is playing
if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
{	
	// Checks if the beam is to the right of the player
	if (x > obj_player.x)
	{
		// Scales the gain by the distance between player and beam to the room width
		audio_sound_gain(beam_sound, 1.0 - clamp(abs(x - obj_player.x) / room_width, 0.0, 1.0), 0.0);
	}
	else
	{
		// Scales the gain by the distance between player and beam to a fraction of the room width
		audio_sound_gain(beam_sound,  1.0 - clamp(abs(x - obj_player.x) / (room_width * 0.33), 0.0, 1.0), 0.0);
	}
}
else
{
	// Fades out the beam sounds
	audio_sound_gain(beam_sound, 0.0, 3000); 
}