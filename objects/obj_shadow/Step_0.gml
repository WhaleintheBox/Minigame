// Checks game isnt paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Checks owner has been set
	if (owner != noone)
	{
		// Set x position to follow owner
		x = owner.x;
	
		// Temp variables for scaling the shadows size based on how high the owner is to the ground where it exists
		var _delta_y = abs(y - owner.y) - y_offset;
		var _scale = 1;
		var _shadow_height = 400;
	
		// Checks the scale has changed from the original height
		if (_delta_y > 0)
		{
			// Recalculate the scale based on the height of the owner compared to the shadow
			_scale = (_shadow_height - clamp(_delta_y, 0, _shadow_height)) * (1 / _shadow_height);
		
		}
	
		// Sets the image alpha to the scale
		image_alpha = _scale;
	
		// Clamp the scale so its a value betwen 0.6 and 1
		_scale = clamp(_scale, 0.6, 1.00);
	
		// Set the actual image scales to 1 devided by the new scale variable 
		image_xscale = 1 / _scale;
		image_yscale = 1 / _scale;
	}
	else
	{
		// Sets shadow to fade out after 0.1 seconds
		fade_out(0.1);
	}

	// Checks if shadow can fade out
	if (can_fade)
	{
		// Sets the shadows fade level to decrease slowly over time set
		fade_level -= (1 / fade_time) * delta_time * 0.000001;
	
		// Checks if the shadow should no longer be visible
		if (fade_level < 0)
		{
			// Sets value back to zero
			fade_level = 0;
		}
	
		// Sets the images alpha to the fade level
		image_alpha *= 	fade_level;
	
		// Checks if the alpha is equal to 0 (invisible)
		if (image_alpha == 0)
		{
			// Destroys the shadow object
			instance_destroy();	
		}
	}
}