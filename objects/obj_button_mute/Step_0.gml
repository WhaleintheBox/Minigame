// Temp variable for gamepad press check
var _gamepad_press = false;

// Checks gamepad 0 (player 1) connected
if (gamepad_is_connected(0))
{
	// Check face button
	if (gamepad_button_check_pressed(0, gp_face4))
	{
		// Set press to true
		_gamepad_press = true;	
	}
	
	// Check select button
	if (gamepad_button_check_pressed(0, gp_select))
	{
		// Set press to true
		_gamepad_press = true;	
	}
}

// Checks for press from keyboard or gamepad press
if (keyboard_check_pressed(ord("M")) || _gamepad_press)
{
	// Sets hovered and pushed states to false
	is_hovered = false;
	is_pushed = false;
	
	// Sets target scale
	target_scale = 1.0;
	// Calls target function
	target_function();
}

// Inherit the parent event
event_inherited();

