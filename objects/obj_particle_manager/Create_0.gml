// Empty variable for setting the particle system to
particle_sys = -1;

// Variable used for if follows owner
owner = noone;

// Variables used for if effected by world speed
move_rate = 1.0;
move_rate_target = 1.0;
drag_rate = 0.0;

// Variable used offsets
angle_offset = 0;
x_offset = 0;
y_offset = 0;

// Function used for setting particle systems angle
set_angle = function(_new_angle)
{
	// Sets angle offset
	angle_offset = _new_angle;
	// Updates particle systems angle
	part_system_angle(particle_sys, angle_offset);
}

// Function used for setting particle systems offset position
set_offset = function(_x_offset, _y_offset)
{
	// Offset variables set to new temp variables passed in
	x_offset = _x_offset;
	y_offset = _y_offset;
	
	// Positions adjusted by offsets
	x += x_offset;
	y += y_offset;
	
	// Particle position repositioned
	part_system_position(particle_sys, x, y);
}

// Function used for setting particle system
set_particle = function(_new_ps, _layer)
{
	// Creates smoke particle system
	particle_sys = part_system_create_layer(_layer, false, _new_ps);
	// Updates particle system position
	part_system_position(particle_sys, x, y);
}