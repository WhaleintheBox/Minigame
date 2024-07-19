// Checks if the coins current sprite not collected
if (sprite_index == spr_coin_idle)
{	
	// Creates a new gui coin object
	var _gui_coin = instance_create_layer(x, y, "StageFront", obj_coin_gui);
	
	// Creates a new coin particle object
	var _coin_particle = instance_create_layer(_gui_coin.x, _gui_coin.y, "Stage", obj_particle_manager);
	// Sets the gui coin as the particle objects owner
	_coin_particle.owner = _gui_coin;
	// Sets the particle object to use the coin particle effect on the layer specified
	_coin_particle.set_particle(ps_coin, "StageFrontEffects");
	
	// Sets the gui coin object to store the particle object it is attached to
	_gui_coin.child_particle = _coin_particle;
	
	// Plays coin collected sound
	audio_play_sound(snd_coin_collection, 100, false, 1.0);
	
	// Destroys this coin since it was collected
	instance_destroy();
}