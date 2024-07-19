// Checks if the child particle object still exists
if (instance_exists(child_particle))
{
	// Sets the particle to have no parent so its movement will stop tracking
	child_particle.owner = noone;
}