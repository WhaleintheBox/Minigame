// Loops though the bushes
for (var _i = 0; _i < fauna_count; _i++)
{
	// Sets the bushes alpha independently
	draw_set_alpha(set_alphas[_i]);
	// Draws the bush with its set sprite at its set coordinate
	draw_sprite(set_sprites[_i], 0, x_coords[_i], y + 40);
}

// Resets the alpha back to normal
draw_set_alpha(1.0);