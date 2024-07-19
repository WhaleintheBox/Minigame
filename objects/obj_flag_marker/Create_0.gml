// Sets the variables for flag placement and behaviours
has_dropped = false;
has_passed = false;
has_cooldown_adjusted = false;

// Inital fall speed variable
fall_speed = 0;

// Used when warping effect is applied to flag on bounce
is_warping = false;
// Sets the animation curve
warp_curve = animcurve_get_channel(ac_flag_warp, "warp");
// Variable used to track curve
warp_curve_percent = 0;

// Used to store requests within later
handle_request = -1;

// Variable used to store and display the flag distance
flag_distance = 0;

// Text alpha value
text_alpha = 1.0;

// Function used to create firework
create_firework = function()
{
	// Checks flag still exisits
	if (instance_exists(self))
	{
		// Creates firework object at position setting its delay, fuse timer and speed
		var _firework= instance_create_layer(x, y - 100, "Stage", obj_firework);
		_firework.delay = 0.02;
		_firework.death = 0.55;
		_firework.fire_speed = 15;
	}
	else
	{
		// Stops the repeating handle call since no longer exists
		call_cancel(handle_request);	
	}
}