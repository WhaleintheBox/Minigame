// Checks if debug menu variable exists
if (!variable_global_exists("active_debug_menu"))
{
	// Sets to false
	global.active_debug_menu = false;
}
else
{
	// Deletes the debug window
	dbg_view_delete(global.debug_window);
}

// Sets up a new debug window called game info and stores it as a global variable
global.debug_window = dbg_view("Game Info", global.active_debug_menu);

// Creates a section called game manager
dbg_section("Game Manager");
// Object variable for gamestate
game_state = "";
// Watch references for game state and distance travelled
dbg_watch(ref_create(self, "game_state"), "Game State");
dbg_watch(ref_create(obj_game_manager, "current_distance"), "Distance Travelled");

// Creates a section called interior mode
dbg_section("Interior Mode");
// Object variable for interior state
interior_state = "";
// Watch references for interior state
dbg_watch(ref_create(self, "interior_state"), "Interior State");
// Function for button that swaps the interior state
button_interior = function()
{
	// Calls function from object
	obj_interior_background.change_interior_state();	
}
// Sets up button refernece
dbg_button("Change Interior", ref_create(self, "button_interior"), 240, 30);

// Creates a section called player variables
dbg_section("Player Variables");
// Set up all the referneces for speed and distance
dbg_watch(ref_create(obj_game_manager, "current_speed"), "Speed");
dbg_watch(ref_create(obj_game_manager, "current_speed_percentage"), "Speed Percent");
dbg_slider(ref_create(obj_game_manager, "target_speed_percentage"), 0.0, 1.0, "Speed Target");
dbg_text_input(ref_create(obj_game_manager, "new_max_speed"), "Max Speed");
dbg_text_input(ref_create(obj_game_manager, "current_distance"), "Current Distance");

// Calls show overlay
show_debug_overlay(global.active_debug_menu);