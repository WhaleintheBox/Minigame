// Checks if the player is dead
if (current_player_state == PLAYER_STATE.DEATH)
{
	// Sets alpha to zero to hide
	image_alpha = 0;
}
// Checks if the player is idle
else if (current_player_state == PLAYER_STATE.IDLE)
{
	// Sets the animation to small flying state
	current_player_state = PLAYER_STATE.FLY_SMALL;
	// Resets the set sprite to idle
	sprite_index = spr_character_idle;
}