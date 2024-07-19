// Check if the game is in the tutorial
if (obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
{
	// Set the alpha value to zero (invisible)
	image_alpha = 0;
}
else
{
	// Lerp the alpha value to visible
	image_alpha = lerp(image_alpha, 1.0, 0.05);
}

// Draw the gui background
draw_self();

// Setup the main font
draw_set_font(fnt_rowdies_28);

// Setup the font colour
draw_set_color(c_white);
draw_set_alpha(image_alpha);

// Set alignment
draw_set_halign(fa_right);
draw_set_valign(fa_top);

// Draw main distance text parsed (scientific notation with shorthand values for k, m etc) in meters
draw_text(x + 145, y - 8, parse_value(obj_game_manager.current_distance) + "M");

// Draw gold coin icon
draw_sprite(spr_gold_icon, 0, x - 5, y + 50);

// Setup the coin text
var _colour_coin_text = make_color_rgb(255, 218, 55);
draw_set_color(_colour_coin_text);

// Set alignment
draw_set_halign(fa_left);

// Draw the current gold value
draw_text(x + 52, y + 60, parse_value(obj_game_manager.current_gold));

// Reset the colour options
draw_set_color(c_white);
draw_set_alpha(1.0);

// Reset the alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);