// Checks panel state
if (has_panel)
{
	// Draws panel sprite
	draw_sprite_ext(spr_button_panel, 0, x, y + 15, 1.0, 1.0, 0, c_white, image_alpha);	
}

// Draws button sprite
draw_self();