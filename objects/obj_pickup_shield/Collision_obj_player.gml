// Creates a shield object that surrounds the player
var _shield = instance_create_layer(x, y, "StageFront", obj_shield);
// Gives the shield life
_shield.life = 10.0;

// Creates and sets a new particle handler object with the power up collected particle effect attached to the player
var _new_aura_particle = instance_create_layer(other.x, other.y, "Stage", obj_particle_manager);
_new_aura_particle.owner = other;
_new_aura_particle.set_particle(ps_powerup_in, "StageFrontEffects");

// Plays collect sound
audio_play_sound(snd_shield_bonus_collection, 100, false, 1.0);

// Destroys the pickup
instance_destroy();