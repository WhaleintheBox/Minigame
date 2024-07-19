// Checks if the owner currently exists
if (owner == noone)
{
	// Checks if the move rate is not equal to the current move rate (Drag)
	if (move_rate != move_rate_target)
	{
		// Adjusts the move rate by lerping to the target at the set drag rate
		move_rate = lerp(move_rate, move_rate_target, drag_rate);
	}
	
	// Checks the game is not currently paused
	if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
	{
		// Adjusts the x position by the current speed and move rate
		x -= obj_game_manager.current_speed * move_rate;
	}
}
else
{
	// Sets the x and y positions by the offsets and the owners position
	x = owner.x + x_offset;
	y = owner.y + y_offset;
}

// Updates the particle system to the objects position
part_system_position(particle_sys, x, y);

// Checks if the game state is paused
if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	// Stops updating the particle systems
	part_system_automatic_update(particle_sys, false)
}
else
{
	// Resumes updating the particle systems
	part_system_automatic_update(particle_sys, true)
}

// Checks if the particle system has finished
if (part_particles_count(particle_sys) == 0)
{
	// Destroys the object
	instance_destroy();
}