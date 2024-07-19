// Sets the shield to initally be invisible
image_alpha = 0;

// Life variable for shield counts down till it should end
life = 0;

// State for if shield can have pulse effect when dying
can_pulse = false;

// Plays shield sound
shield_sound = audio_play_sound(snd_shield_effect, 100, true, 1.0);

// Checks if the game is not playing (collected after player dealth)
if (obj_game_manager.current_game_state != GAME_STATE.PLAYING)
{
	// Sets the sprite into the off state to kill immediately
	sprite_index = spr_shield_off;
}