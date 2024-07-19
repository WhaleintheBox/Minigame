// Checks hovered and pushed
if(is_hovered && is_pushed)
{
	// Unsets hovered and pushed states
	is_hovered = false;
	is_pushed = false;
	
	// Sets the target scale back to default value
	target_scale = scale_default;
	// Calls the target function
	target_function();
}