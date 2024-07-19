// Checks if the game is not currently paused
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
	// Sets the shield position to the players positions
	x = obj_player.x;
	y = obj_player.y;
	
	// Reduce the shields life by time passed
	life -= delta_time * 0.000001;
	
	// Sets the image to lerp towards visible state
	image_alpha = lerp(image_alpha, 1.0, 0.1);

	// Checks the life values to know if pulsing should be enabled
	if (life > 0 && life < 2)
	{
		// Sets pulsing state
		can_pulse = true;
	}
	else
	{
		// Unsets pulsing state as more life may have been added
		can_pulse = false;
	}

	// Checks if shield is dead but not set to dead yet
	if (life <= 0 && sprite_index != spr_shield_off)
	{
		// Creates power up out effect
		var _new_aura_particle = instance_create_layer(obj_player.x, obj_player.y, "Stage", obj_particle_manager);
		_new_aura_particle.owner = obj_player;
		_new_aura_particle.set_particle(ps_powerup_out, "StageFrontEffects");
		
		// Sets sprite to off sprite
		sprite_index = spr_shield_off;
		image_index = 0;
		
		// Sets the gain of shield sound to off
		audio_sound_gain(shield_sound, 0.0, 100);
		
		// Plays shield break sound
		audio_play_sound(snd_shield_deactivated, 100, false, 1.0);
	}

	// Plays animation speed normally
	image_speed = 1;	
}
else
{
	// Pauses animation speed
	image_speed = 0;
}

if (sprite_index != spr_shield_off)
{
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		// Sets the gain of shield sound to on
		audio_sound_gain(shield_sound, 1.0, 0);
	}
	else
	{
		// Sets the gain of shield sound to off
		audio_sound_gain(shield_sound, 0.0, 0);
	}
}