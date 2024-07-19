// Checks if the game is paused
if (obj_game_manager.current_game_state == GAME_STATE.PAUSED)
{
	// Fades out the sounds
	audio_sound_gain(jet_sound, 0.0, 100); 
	audio_sound_gain(air_sound, 0.0, 100); 
	
	// Exits this event as no new particles need to be drawn
	exit;	
}

// Set up temp variables for the particle effects
var _new_flame_particle = -1;
var _new_flame_glow = -1;
var _new_smoke_particle = -1;
var _new_shimmer_particle = -1;

// Check the players states
switch (current_player_state)
{
	// When big jumping up
	case PLAYER_STATE.FLY_BIG:
		
		// Checks if the right sound file is playing
		if (audio_get_name(jet_sound) != "snd_jet_turbine")
		{
			// Stops the current sound
			audio_stop_sound(jet_sound);
			// Plays the correct sound
			jet_sound = audio_play_sound(snd_jet_turbine, 100, false, 1.0);
		}
		else
		{
			// Sets sound gain
			audio_sound_gain(jet_sound, 1.0, 0); 
		}
		
		// Sets sound gain
		audio_sound_gain(air_sound, 1.0, 0);
		
		// Long flame press effect
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.owner = self;
		_new_flame_particle.set_particle(ps_long_press_flame, "StageBackEffects");
		_new_flame_particle.set_offset(5, 95);
		
		// Flame glow effect
		_new_flame_glow = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_glow.owner = self;
		_new_flame_glow.set_particle(ps_flame_glow, "StageFrontEffects");
		_new_flame_glow.set_offset(5, 95);
		
		// Long press smoke effect
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_smoke_particle.move_rate = 0.0;
		_new_smoke_particle.drag_rate = 0.04;
		_new_smoke_particle.set_particle(ps_long_press_smoke, "StageFrontEffects");
		_new_smoke_particle.set_angle(180);
		_new_smoke_particle.set_offset(0, 100);
		
		// Checks if game is in tutorial mode
		if (obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
		{
			// Exits as shimmers not needed
			break;	
		}
		
		// Sets shimmers to normal level
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
	
	// When small jumping
	case PLAYER_STATE.FLY_SMALL:
	
		// Checks if the right sound file is playing
		if (audio_get_name(jet_sound) != "snd_jet_turbine")
		{
			// Stops the current sound
			audio_stop_sound(jet_sound);
			// Plays the correct sound
			jet_sound = audio_play_sound(snd_jet_turbine, 100, false, 1.0);
		}
		else
		{
			// Sets sound gain
			audio_sound_gain(jet_sound, 1.0, 0); 
		}
		
		// Sets sound gain
		audio_sound_gain(air_sound, 1.0, 0);
	
		// Small press flame effect
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.owner = self;
		_new_flame_particle.set_particle(ps_short_press_flame, "StageBackEffects");
		_new_flame_particle.set_offset(5, 95);
		
		// Flame glow effect
		_new_flame_glow = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_glow.owner = self;
		_new_flame_glow.set_particle(ps_flame_glow, "StageFrontEffects");
		_new_flame_glow.set_offset(5, 95);
		
		// Smoke particle effect
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_smoke_particle.move_rate = 0.0;
		_new_smoke_particle.drag_rate = 0.04;
		_new_smoke_particle.set_particle(ps_short_press_smoke, "StageFrontEffects");
		_new_smoke_particle.set_angle(180);
		_new_smoke_particle.set_offset(0, 100);
		
		// When game state is in tutorial mode
		if (obj_game_manager.current_game_state == GAME_STATE.TUTORIAL)
		{
			// Exits as shimmers not needed
			break;	
		}
		
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
	
	// When boosting
	case PLAYER_STATE.BOOST:
	
		// Checks if the right sound file is playing
		if (audio_get_name(jet_sound) != "snd_jet_speed")
		{
			// Stops the current sound
			audio_stop_sound(jet_sound);
			// Plays the correct sound
			jet_sound = audio_play_sound(snd_jet_speed, 100, true, 1.0);
		}
		else
		{
			// Sets sound gain
			audio_sound_gain(jet_sound, 1.0, 0); 
		}
		
		// Sets sound gain
		audio_sound_gain(air_sound, 1.0, 0);
	
		// Creates speed boosting aura effect
		var _new_aura_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_aura_particle.owner = self;
		_new_aura_particle.set_particle(ps_speed_booster_aura, "StageFrontEffects");
		_new_aura_particle.set_angle(270);
		_new_aura_particle.set_offset(-140, 10);
	
		// Creates speed boosting flame effect
		_new_flame_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_flame_particle.owner = self;
		_new_flame_particle.set_particle(ps_speed_booster_flame, "StageBackEffects");
		_new_flame_particle.set_angle(270);
		_new_flame_particle.set_offset(-100, 30);
	
		// Creates speed boosting smoke effect
		_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
		_new_smoke_particle.owner = self;
		_new_smoke_particle.set_particle(ps_speed_booster_smoke, "StageFrontEffects");
		_new_smoke_particle.set_angle(90);
		_new_smoke_particle.set_offset(-100, 30);
		
		// Creates intense shimmmering effect
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers_intense, "StageFrontEffects");
		
	break;
	
	// When player is normal running
	case PLAYER_STATE.RUN:
	
		// Sets sound gain to 0 and resets jet sound
		audio_stop_sound(jet_sound);
		jet_sound = audio_play_sound(snd_jet_air, 100, true, 0.0);
		audio_sound_gain(air_sound, 0.0, 0);
		
		// If the player is running fast enough (more than 5%)
		if (obj_game_manager.current_speed_percentage > 0.05)
		{
			// Create running dust effect
			_new_smoke_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
			_new_smoke_particle.move_rate = 0;
			_new_smoke_particle.drag_rate = 0.005;
			_new_smoke_particle.set_particle(ps_run_dust, "StageBackEffects");
			_new_smoke_particle.set_offset(-10, 85);
		}
		
		// When the game is not in the tutorial
		if (obj_game_manager.current_game_state != GAME_STATE.TUTORIAL)
		{
			// Create the shimmering effect
			_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
			_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		}
		
		// Checks the for step frame and step hasnt played for the step
		if (!has_stepped && (round(image_index) == 2 || round(image_index) == 7))
		{
			// Chooses a random footstep
			var _footstep = choose(snd_chicken_footstep_1, snd_chicken_footstep_2, snd_chicken_footstep_3, snd_chicken_footstep_4, snd_chicken_footstep_5, snd_chicken_footstep_6, snd_chicken_footstep_7);
			// Plays the footstep sound
			audio_play_sound(_footstep, 100, false, 1.0);
			
			// Sets step state to true
			has_stepped = true;
		}
		// Checks is not currently on a step frame
		else if (!(round(image_index) == 2 || round(image_index) == 7))
		{
			// Sets step state to false
			has_stepped = false;	
		}
	
	break;
	
	// When the player is idle
	case PLAYER_STATE.IDLE:
	
		// Sets sound gain to 0 and resets jet sound
		audio_stop_sound(jet_sound);
		jet_sound = audio_play_sound(snd_jet_air, 100, true, 0.0);
		audio_sound_gain(air_sound, 0.0, 0);
	
		// Game is not in tutorial
		if (obj_game_manager.current_game_state != GAME_STATE.TUTORIAL)
		{
			// Create shimmering effect
			_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
			_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		}
	
	break;
	
	// When player has relased the fly button
	case PLAYER_STATE.FLY_RELEASED:
	
		// Sets sound gain and resets jet sound
		audio_stop_sound(jet_sound);
		jet_sound = audio_play_sound(snd_jet_air, 100, true, 0.0);
		audio_sound_gain(air_sound, 1.0, 0);
		
		// Game is not in tutorial
		if (obj_game_manager.current_game_state != GAME_STATE.TUTORIAL)
		{
			// Create shimmering effect
			_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
			_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		}
		
	break;
	
	// When the player is dying
	case PLAYER_STATE.DEATH:
	
		// Sets sound gain to 0 and resets jet sound
		audio_stop_sound(jet_sound);
		jet_sound = audio_play_sound(snd_jet_air, 100, true, 0.0);
		audio_sound_gain(air_sound, 0.0, 0);
	
		// If the game has ended
		if (obj_game_manager.current_game_state == GAME_STATE.ENDED)
		{
			// Exits without shimmers
			break;	
		}
	
		// Create shimmers as player is technically still moving
		_new_shimmer_particle = instance_create_layer(0, 0, "Stage", obj_particle_manager);
		_new_shimmer_particle.set_particle(ps_glimmers, "StageFrontEffects");
		
	break;
}