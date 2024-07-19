// Checks if the shield still has life
if (other.life > 0)
{
	// Adds life to the shield so it lasts longer
	other.life += 10.0;
	
	// Creates and sets a new particle handler object with the power up collected particle effect attached to the player
	var _new_aura_particle = instance_create_layer(obj_player.x, obj_player.y, "Stage", obj_particle_manager);
	_new_aura_particle.owner = obj_player;
	_new_aura_particle.set_particle(ps_powerup_in, "StageFrontEffects");
	
	// Plays collect sound
	audio_play_sound(snd_shield_bonus_collection, 100, false, 1.0);

	// Destroys the pickup
	instance_destroy();	
}