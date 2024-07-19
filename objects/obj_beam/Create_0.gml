// Check for knowing if object has hit the player
has_hit = false;

// Creates an alert object at its high point with itself as owner
var _alert_high = instance_create_layer(room_width - 100, y - 100, "GUI", obj_alert);
_alert_high.owner = self;

// Creates an alert object at its low point with itself as owner
var _alert_low = instance_create_layer(room_width - 100, y + 100, "GUI", obj_alert);
_alert_low.owner = self;

// Beam sound effect
beam_sound = audio_play_sound(snd_force_field, 100, true, 0.0);