// Owner object of shadow
owner = noone;

// Y offset applied to position
y_offset = 0;

// Transition variables
can_fade = false;
fade_time = 0;
fade_level = 1.0;

// Sets shadows y offset
set_y_offset = function(_y_offset)
{
	// Stores offset
	y_offset = _y_offset;
	// Applies offset
	y += y_offset;
}

// Sets shadow to fade out over time
fade_out = function (_time)
{
	// Sets fade state to true
	can_fade = true;
	// Sets fade out time
	fade_time = _time;
}