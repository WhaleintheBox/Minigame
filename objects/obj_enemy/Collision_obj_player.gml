// Checks if object has hit player
if (!has_hit)
{
	// Plays impact sound
	audio_play_sound(snd_dino_robot_impact, 100, false, 1.0);
	
	// Calls kill player function
	other.kill_player();
	// Sets hit flag to true
	has_hit = true;
}