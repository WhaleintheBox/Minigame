// Variable for tip type state
tip_type = 0;
// Variable for tip message string
tip_message = "Welcome to Whale in the Box Run!\nPress any key to continue";
// Variable for knowing if gamepad is used
is_gamepad = false;

// Used for time an action should be preformed
action_timer = 0;
// Used to lock the jump ability
can_jump = false;

// Checks gamepads exist
var _gamepad_count = gamepad_get_device_count();
for (var _i = 0; _i < _gamepad_count; _i++;)
{
	// If gamepad is connected
    if (gamepad_is_connected(_i))
    {
		// Set gamepad state to true
        is_gamepad = true;
		
		// Change default message
		tip_message = "Welcome to Whale in the Box - Run!\nPress A or Cross button to continue";
    }
}

// Check if touch input
if (global.is_touch)
{
	// Change message
	tip_message = "Welcome to Whale in the Box - Run!\nTap screen to continue";
}

// Create skip button for tutorial
var _skip_button = instance_create_layer(1740, 890, "GUI", obj_button_skip);