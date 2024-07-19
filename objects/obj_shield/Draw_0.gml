// Checks if game is paused
if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	// Pauses animation speed
	image_speed = 0;
}
else
{
	// Plays animation speed normally
	image_speed = 1;
}

// Creates temp variable for blend rate
var _blend_rate = 1.0;

// Checks pulse state
if (can_pulse)
{
	// Sets rate to vaule set by current life remaining and cos function so value goes between 0 and 1
	_blend_rate = cos(pi / (life % 8));
}

// Sets warn colour to near red
var _warn_colour = make_color_rgb(255, 220, 220);
// Blends the image colour to value of blend rate beween set warn colour and white
image_blend = merge_color(_warn_colour, c_white, _blend_rate);

// Draws shield
draw_self();