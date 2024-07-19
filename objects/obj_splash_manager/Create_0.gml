// Checks if the platform type is mobile
if (os_type == os_android || os_type == os_ios) {
    // Sets global touch to true
    global.is_touch = true;
} else {
    // Sets global touch to false
    global.is_touch = false;
}

// Makes the project fullscreen
window_set_fullscreen(true);

// Play splash sequence for menu UI
var _splash_seq = layer_sequence_create("Instances", 0, 0, seq_splash);

// Stops all previous running audio
audio_stop_all();

// Play audio for main menu
global.music = audio_play_sound(snd_menu_music, 100, true, 1.0);

// Check for highscore variable
if (!variable_global_exists("highscore")) {
    // Create empty variable for highscore
    global.highscore = 0;

    // Loads buffer for highscore
    highscore_buffer = buffer_load("ENDLESS_RUNNER_HS.sav");

    // Checks if buffer exists
    if (buffer_exists(highscore_buffer)) {
        // Goes to the start of the buffer
        buffer_seek(highscore_buffer, buffer_seek_start, 0);

        // Sets the highscore to value from the buffer
        global.highscore = buffer_read(highscore_buffer, buffer_u64);
    } else {
        // Creates highscore buffer
        highscore_buffer = buffer_create(16384, buffer_fixed, 2);

        // Goes to the start of the buffer
        buffer_seek(highscore_buffer, buffer_seek_start, 0);

        // Writes highscore value to the buffer
        buffer_write(highscore_buffer, buffer_u64, global.highscore);

        // Saves the new empty highscore buffer
        buffer_save(highscore_buffer, "ENDLESS_RUNNER_HS.sav");
    }
}

// Check if game has been played this session
if (!variable_global_exists("times_played")) {
    // Creates times played variable and sets to zero
    global.times_played = 0;
}

// Create obj_title instance at the center of the screen if it does not exist already
if (!instance_exists(obj_title)) {
    var title_instance = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_title);

    // Initialize movement variables for obj_title
    title_instance.title_start_x = title_instance.x;
    title_instance.title_start_y = title_instance.y;
    title_instance.title_amplitude = 10; // Amplitude of the movement
    title_instance.title_speed = 0.1;    // Speed of the movement
    title_instance.title_timer = 0;
}
