// Checks if button can scale at rate
if (can_scale_at_rate)
{
	// When image scale is less than target
	if (image_xscale < target_scale)
	{
		// Use up rate to lerp scale up towards target
		image_xscale = lerp(image_xscale, target_scale, scale_up_rate);
		image_yscale = lerp(image_yscale, target_scale, scale_up_rate);
	}
	else
	{
		// Use down rate to lerp value down towards target
		image_xscale = lerp(image_xscale, target_scale, scale_down_rate);
		image_yscale = lerp(image_yscale, target_scale, scale_down_rate);
	}
}
else
{
	// Set the image scales right to the target scales
	image_xscale = target_scale;
	image_yscale = target_scale;
}

// Check if mouse is over the current button
if (position_meeting(mouse_x, mouse_y, self))
{
	// Sets hover state to true
	is_hovered = true;

	// Checks button has not been pushed
	if (!is_pushed)
	{
		// Sets the target scale to highlighted value
		target_scale = scale_highlighted;	
	}
}