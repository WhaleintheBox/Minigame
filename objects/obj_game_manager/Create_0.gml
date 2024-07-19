//// Game Manager Object.
// This object is used to control the main game loop and stores information for use in other objects.

// Sets new random seed
randomise();

// Game states.
enum GAME_STATE
{
	PLAYING,
	DYING,	
	ENDED,
	PAUSED,
	TUTORIAL,
	SIZE
}

// Variables for gameplay (gold tracking is what will speed up the player later in the game)
current_level = 1;
current_level_gold = 0;
current_distance = 0;
current_gold = 0;

// Stops the music track that was previously playing
audio_stop_sound(global.music);

// Checks if the game has been played before
if (global.times_played == 0)
{
	// Sets the game state to tutorial mode
	current_game_state = GAME_STATE.TUTORIAL;
	// Creates the tutorial object
	instance_create_layer(room_width * 0.5, room_height * 0.5, "GUI", obj_tutorial);
	
	// Play audio for tutorial
	global.music = audio_play_sound(snd_ambience, 100, true, 1.0);
}
else
{
	// Sets the game to play normally
	current_game_state = GAME_STATE.PLAYING;
	
	// Spawns the inital GameMaker logo in coins to fill in dead space
	layer_sequence_create("Stage", 0, 0, seq_gm_layout);
	
	// Checks if a highscore has been previously set
	if (global.highscore != 0)
	{
		// Creates a flag object for the highscore at its position it would be in
		var _flag = instance_create_layer(640 + real(global.highscore) * 60, 950, "StageBack", obj_flag_marker);
		// Sets the flag paramerters to know it has droppped and the score it should have
		_flag.has_dropped = true;
		_flag.flag_distance = global.highscore;
	}
	
	// Plays the games main music
	global.music = audio_play_sound(snd_infinite_runner_music, 100, true, 0.5);
}

// Counts up the times played
global.times_played++;

/// Variables used to control the players speed
// Min speed is the slowest possible speed for players (ie zero for stopped)
min_speed = 0.0;
// Max speed is the current maximum speed allowed (Boosted speed)
max_speed = 24.0;
// Sets the new max speed as the current max speed (this variable is what adjusts the games speed curves
new_max_speed = max_speed;
// True max speed the the absolute fastest a player can go
true_max_speed = 72.0;

// Current speed is what tracks current movement for the backgrounds and level elements that need to move over time
current_speed = 0.0;

// The speed percentages are used to gradually increase and decrease the speed using smooth step interpolation 
current_speed_percentage = 0.0;
target_speed_percentage = 0.5;

// The rate speed will go up or down so the player will stop or slow down quicker than speeding up
speed_up_rate = 0.2;
speed_down_rate = 0.5;

// Initial cooldown for the background changing
background_cooldown = 100;

// Flag used to check if the environments have finished loading to before starting the game
has_prefetched = false;

// Creates game objects for room environment
instance_create_layer(0, 0, "Farground", obj_far_background);
instance_create_layer(0, 0, "Midground", obj_interior_background);
instance_create_layer(0, 0, "Midground", obj_mid_background);
instance_create_layer(0, 0, "Foreground", obj_front_floor);
instance_create_layer(0, 0, "Foreground", obj_front_ceiling);

// Creates player object
instance_create_layer(0, 0, "Stage", obj_player);

// Function used to update the speed with delta time passed though as that is the time passed this frame meaning more accurate movement
update_speed = function(_delta_time)
{
	// Checks if a player has collected 50 gold since the last time they leveled up
	if (current_level_gold >= 50)
	{
		// Removed the gold from their current count
		current_level_gold -= 50;
		// Increases the level
		current_level++;
		// Sets the max speed to be 5% faster
		new_max_speed = max_speed * 1.05;
	}
	
	// Limits the max speed to the true max speed
	if (new_max_speed > true_max_speed)
	{
		// Sets max to true max
		new_max_speed = true_max_speed;	
	}
	
	// Checks if new max speed has changed.
	if (new_max_speed != max_speed)
	{	
		// Adjusts the percentage.
		current_speed_percentage *= max_speed / new_max_speed;
		// Sets max speed to new value.
		max_speed = new_max_speed;
	}
	
	// Check if speed is less than target.
	if (current_speed_percentage < target_speed_percentage)
	{
		// Speed up at rate.
		current_speed_percentage += speed_up_rate * _delta_time;
		
		// Limit speed to target.
		current_speed_percentage = min(current_speed_percentage, target_speed_percentage);
	
		// Interpolate speed using smoothstep curve.
		current_speed = smoothstep(min_speed, max_speed, current_speed_percentage);
	}
	// Check if speed is greater than target.
	else if (current_speed_percentage > target_speed_percentage)
	{
		// Slow down at rate.
		current_speed_percentage -= speed_down_rate * _delta_time;
		
		// Limit speed to target.
		current_speed_percentage = max(current_speed_percentage, target_speed_percentage);
	
		// Interpolate speed using smoothstep curve.
		current_speed = smoothstep(min_speed, max_speed, current_speed_percentage);
	}
	
	// Checks if game is not running in tutorial mode
	if (current_game_state != GAME_STATE.TUTORIAL)
	{
		// Add current speed to distance traveled.
		current_distance += current_speed * _delta_time;
	}
}