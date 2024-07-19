// Checks panel state
if (has_panel)
{
	// Draws panel sprite if needed
	draw_sprite_ext(spr_button_panel, 0, x, y + 15, 1.0, 1.0, 0, c_white, image_alpha);	
}

// Sets font
draw_set_font(fnt_rowdies_34);
// Sets colour
draw_set_color(c_white);
// Sets alpha
draw_set_alpha(image_alpha);

// Sets text alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw skip text at scale
draw_text_ext_transformed(x, y, "SKIP", 10, 300, image_xscale, image_yscale, 0);

// Reset draw values
draw_set_color(c_white);
draw_set_alpha(1.0);

// Reset text alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);













