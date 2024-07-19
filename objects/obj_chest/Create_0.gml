// Creates a sequence manager object for the chests idle animation
sequence_body = instance_create_layer(x, y, "Stage", obj_sequence_manager);
// Sets the owner to the chest
sequence_body.owner = self;
// Sets the object to use the idle sequence
sequence_body.create_seq(seq_chest_idle, "Stage");

// Creates new shadow object instance
var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);

// Sets the shadow instance to chest parameters and targets self as owner of it
_shadow.sprite_index = spr_chest_shadow;
_shadow.owner = self;
_shadow.set_y_offset(40);

// State for if idle
is_idle = true;

// Sound effect for the chest
chest_sound = audio_play_sound(snd_coin_chest, 100, true, 0.0);

// Function used for creating sparkles
create_sparkles = function()
{
	// Creates and sets sparkle particles objects at 3 offset points setting them to the correct effects aswell
	var _sparkle_particle = instance_create_layer(x - 85, y - 85, "Stage", obj_particle_manager);
	_sparkle_particle.set_particle(ps_sparkle_chest, "StageBackEffects");
	_sparkle_particle = instance_create_layer(x, y - 85, "Stage", obj_particle_manager);
	_sparkle_particle.set_particle(ps_sparkle_chest, "StageBackEffects");
	_sparkle_particle = instance_create_layer(x + 85, y - 85, "Stage", obj_particle_manager);
	_sparkle_particle.set_particle(ps_sparkle_chest, "StageBackEffects");
}