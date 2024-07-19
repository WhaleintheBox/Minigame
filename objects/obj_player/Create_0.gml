// Sets the inital player position
x = 640;
y = 840;

// Sets the start y value to y
ystart = y;

// Enum states used for the player
enum PLAYER_STATE
{
	IDLE,
	RUN,
	FLY_SMALL,
	FLY_BIG,
	FLY_RELEASED,
	BOOST,
	DEATH
}

// Sets the players current state
current_player_state = PLAYER_STATE.RUN;

// Variables used for the players movement
jump_strength = 110;
jump_threshold = 10;
gravity_strength = 0.8;
y_velo = 0.0;

// Boosting variables
is_boosting = false;
boost_cooldown = 0;

// Jump state
has_jumped = false;

// Footstep state
has_stepped = false;

// Plays jet sound with no gain
jet_sound = audio_play_sound(snd_jet_turbine, 100, false, 0.0);

// Plays air sound with no gain
air_sound = audio_play_sound(snd_jet_air, 100, true, 0.0);

// Creates a shadow to follow the player with the owner and offset setup to the player
var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);
_shadow.owner = self;
_shadow.set_y_offset(100);

// Function used when the player is hit by an enemy
kill_player = function()
{
	// Checks the game is playing
	if (obj_game_manager.current_game_state == GAME_STATE.PLAYING)
	{
		// Checks if a shield object exists within the room
		if (instance_exists(obj_shield))
		{
			//// Plays shield break sound
			//var _shield_break = audio_play_sound(snd_force_field_impact, 100, false, 1.0);
			
			// With that (and all) shields
			with (obj_shield)
			{
				// Set their life to 0 so they die
				life = 0;
				exit;
			}
		}
		else
		{
			// Plays death sound
			audio_play_sound(snd_chicken_death, 100, false, 1.0);
			
			// Sets the player to die
			obj_game_manager.current_game_state = GAME_STATE.DYING;
			
			// Lowers the music
			audio_sound_gain(global.music, 0.1, 3000);
			
			// Creates a boom particle effect by using a manager object
			var _boom_particle = instance_create_layer(x, y, "Stage", obj_particle_manager);
			_boom_particle.owner = self;
			_boom_particle.set_particle(ps_defeat, "StageEffects");
		
			// Sets the player to a temp variable
			var _player = self;
			
			// Checks with all shadows in the room
			with (obj_shadow)
			{
				// If the player is the owner
				if (owner == _player)
				{
					// Call fade out function
					fade_out(2.2);	
				}
			}
		}
	}
}