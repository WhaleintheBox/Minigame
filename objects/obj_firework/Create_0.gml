// Variables set up for firework to use after being set
life = 0;
delay = 0;
death = 0;

// Tilt variable set to random swing of 10 degrees either way
tilt = random_range(-10, 10);
// Direction set to face up with added tilt
direction = 90 + tilt;

// Sets the inital fire speed
fire_speed = 1;

// Particle effects to be used for the firework
trail_ps = ps_firework_trail;
head_ps = ps_firework;

// Plays firework trail sound
var _sfx_trail = audio_play_sound(snd_celebration_firework, 100, false, 0.25, 0.0, random_range(0.95, 1.05));
audio_sound_set_track_position(_sfx_trail, 3.0);
audio_sound_gain(_sfx_trail, 0.0, 1750);

// Create ps function called to create new particle effect later
create_ps = function(_type)
{
	var _new_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
	_new_particle.set_particle(_type, "StageBackEffects");
	_new_particle.set_angle(tilt);
}