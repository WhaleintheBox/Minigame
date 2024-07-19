// Loops through the vines
for (var _i = 0; _i < fauna_count; _i++)
{
	// Sets the draw alpha values
	draw_set_alpha(set_alphas[_i]);
	// Draws the sprites at set positions
	draw_sprite(set_sprites[_i], 0, x_coords[_i], y);
}

// Sets the draw alpha back to default
draw_set_alpha(1.0);