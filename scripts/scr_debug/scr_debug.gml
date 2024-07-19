// Debug Scripts
function bug_restart()
{
	game_restart();
	show_debug_message("Room restarted");
}

function bug_set_state(_new_state)
{
	obj_game_manager.current_game_state = _new_state;
	show_debug_message("Game state changed to: " + get_gamestate());
}