// Sets the player to boosting
obj_player.is_boosting = true;
// Adds time to the player booter cooldown
obj_player.boost_cooldown += 5;

// Creates and sets a new particle handler object with the power up collected particle effect attached to the player
var _new_aura_particle = instance_create_layer(other.x, other.y, "Stage", obj_particle_manager);
_new_aura_particle.owner = other;
_new_aura_particle.set_particle(ps_powerup_in, "StageFrontEffects");

// Plays collect sound
audio_play_sound(snd_speed_bonus_collection, 100, false, 1.0);

// Destroys this pickup instance
instance_destroy();