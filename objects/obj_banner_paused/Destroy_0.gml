// Destroy buttons assocciated to pause menu
instance_destroy(obj_button_play_paused);
instance_destroy(obj_button_home);
instance_destroy(obj_button_retry);

// Return the sound pitch and gain to normal
audio_sound_gain(global.music, 0.5, 4000);
audio_sound_pitch(global.music, 1.0);