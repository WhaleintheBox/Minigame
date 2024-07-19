// Checks if beam has already hit the player
if (!has_hit)
{
	// Plays impact sound
	audio_play_sound(snd_force_field_impact, 100, false, 1.0);
	
	// Calls the players kill function
	other.kill_player();
	// Sets the hit flag to true
	has_hit = true;
}