/// Smoothstep interpolation function
// Takes in start (lowest), end (highest) and value (percentage) to output value the curves and slows more gradual
function smoothstep(_start, _end, _value)
{
	// Returns the lerped values
	return lerp(_start, _end, _value * _value * (3 - 2 * _value));
}

/// Parse value function
// Takes in value of coins or distance and returns a string with value and short hand notation for k, m, b etc
function parse_value(_value)
{
	// Stores the temp value as a floored string value
	var _read_value = string(floor(_value));
	
	// Checks if the value is under 1000
	if (_value < power(10, 3))
	{
		return _read_value + "";	
	}
	// Checks if the value is under a million
	else if (_value < power(10, 6))
	{
		_read_value = string(_value / power(10, 3));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "K";	
	}
	// Checks if the value is under a billion
	else if (_value < power(10, 9))
	{
		_read_value = string(_value / power(10, 6));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "M";	
	}
	// Checks if the value is under a trillion
	else if (_value < power(10, 12))
	{
		_read_value = string(_value / power(10, 9));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "B";	
	}
	// Checks if the value is under quadtrillion
	else if (_value < power(10, 15))
	{
		_read_value = string(_value / power(10, 12));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "T";	
	}
	// Checks if the value is under a quintillion
	else if (_value < power(10, 18))
	{
		_read_value = string(_value / power(10, 15));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Qa";	
	}
	// Checks if the value is under sextillion
	else if (_value < power(10, 21))
	{
		_read_value = string(_value / power(10, 18));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Qi";	
	}
	// Checks if the value is under septillion
	else if (_value < power(10, 24))
	{
		_read_value = string(_value / power(10, 21));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Sx";	
	}
	// Checks if the value is under octillion
	else if (_value < power(10, 27))
	{
		_read_value = string(_value / power(10, 24));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Sp";	
	}
	// Checks if the value is under nonillion
	else if (_value < power(10, 30))
	{
		_read_value = string(_value / power(10, 27));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Oc";	
	}
	// Checks if the value is under decillion
	else if (_value < power(10, 33))
	{
		_read_value = string(_value / power(10, 30));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "No";	
	}
	// Returns the value in decillion
	else
	{
		_read_value = string(_value / power(10, 33));
		
		if (string_length(_read_value) > 5)
		{
		    _read_value = string_copy(_read_value, 1, 5);
		}
		
		return _read_value + "Dc";	
	}
}

// Function that returns the current gamestate as a string
function get_gamestate()
{
	switch(obj_game_manager.current_game_state)
	{
		case GAME_STATE.DYING:
			return "Dying";
		case GAME_STATE.ENDED:
			return "Ended";
		case GAME_STATE.PAUSED:
			return "Paused";
		case GAME_STATE.PLAYING:
			return "Playing";
		case GAME_STATE.TUTORIAL:
			return "Tutorial";
	}
	
	return "Unset";
}

// Function that returns the current wallstate as a string
function get_interiorstate()
{
	switch(obj_interior_background.current_interior_state)
	{
		case INTERIOR_STATE.ENTER:
			return "Enter";
		case INTERIOR_STATE.EXIT:
			return "Exit";
		case INTERIOR_STATE.INSIDE:
			return "Inside";
		case INTERIOR_STATE.OUTSIDE:
			return "Outside";
	}
	
	return "Unset";
}