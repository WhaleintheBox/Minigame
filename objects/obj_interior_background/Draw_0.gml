// Loops through the wall segements
for (var _i = 0; _i < wall_segment_count; _i++)
{
	// Checks they has sprite set
	if (set_wall_sprites[_i] != -1)
	{
		// Draws at position
		draw_sprite(set_wall_sprites[_i], 0, wall_x_coords[_i], wall_y_coords);	
	}
}

// Loops through the pipe segements
for (var _i = 0; _i < pipe_segment_count; _i++)
{
	// Checks they has sprite set
	if (set_pipe_sprites[_i] != -1)
	{
		// Draws at position
		draw_sprite(set_pipe_sprites[_i], 0, pipe_x_coords[_i], pipe_y_coords);	
	}
}

// Loops through the ground segements
for (var _i = 0; _i < ground_segment_count; _i++)
{
	// Draws at position
	draw_sprite(set_ground_sprites[_i], 0, ground_x_coords[_i], ground_y_coords);
}