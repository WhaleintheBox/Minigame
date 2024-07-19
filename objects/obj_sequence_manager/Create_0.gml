// Set sequence used
set_sequence = -1;

// Variable used for if follows owner
owner = noone;

// Sets up inital after sequence functionality
has_death = false;
stored_function = function(){}

// Function called when death set
set_death = function(_new_function)
{
	// Sets death flag to true
	has_death = true;
	// Stores the stored function as a new one
	stored_function = _new_function;
}

// Functione called when creating new sequences
create_seq = function(_new_seq, _new_layer)
{
	// Sets the variable to the set sequence on a specified layer
	set_sequence = layer_sequence_create(_new_layer, x, y, _new_seq);
}
