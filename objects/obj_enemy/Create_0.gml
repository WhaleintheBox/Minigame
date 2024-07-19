// Flag for knowing if hit and damaged the player
has_hit = false;
// Walking speed variable
walking_speed = 3;

// Variable for footstep state
has_stepped = false;

// Creates a shadow object to follow the enemy and sets up the sprite and offset 
var _shadow = instance_create_layer(x, y, "StageShadows", obj_shadow);
_shadow.sprite_index = spr_enemy_shadow;
_shadow.owner = self;
_shadow.set_y_offset(150);

// Creates an alert object to the position with owner being set
var _alert = instance_create_layer(room_width - 100, y, "GUI", obj_alert);
_alert.owner = self;