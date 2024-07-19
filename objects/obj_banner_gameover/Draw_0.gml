// Draw banner sprite
draw_self();

// Set font
draw_set_font(fnt_rowdies_56);

// Create colour for header
var _text_colour = make_color_rgb(142, 214, 67);
// Set colour
draw_set_color(_text_colour);
	
// Set alpha for text from retry button alpha
draw_set_alpha(obj_button_retry.image_alpha);

// Set text alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw game over text
draw_text(room_width * 0.5, room_height * 0.28, "GAME OVER");

// Set up main body font
draw_set_font(fnt_rowdies_34);

// Set main body text colour and alpha
draw_set_color(c_white);
draw_set_alpha(obj_button_retry.image_alpha);

// Check if player has set new high score
if (obj_game_manager.current_distance == global.highscore)
{
	// Draw text for new high score
	draw_text(room_width * 0.5, room_height * 0.45, "New Best Distance!\n" + string(floor(obj_game_manager.current_distance)) + "M!");
}
else
{
	// Draw text for no new high score
	draw_text(room_width * 0.5, room_height * 0.45, "You reached " + string(floor(obj_game_manager.current_distance)) + "M!\nCurrent Highscore " + string(floor(global.highscore)) + "M");
}

// Set text colour and alpha for well done text
_text_colour = make_color_rgb(255, 199, 5);
draw_set_color(_text_colour);
draw_set_alpha(obj_button_retry.image_alpha);

// Draw well done text
draw_text(room_width * 0.5, room_height * 0.55, "WELL DONE!");

// Reset colour options
draw_set_color(c_white);
draw_set_alpha(1.0);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);