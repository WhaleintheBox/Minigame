// Checks for shift and tab button combo
if (keyboard_check_direct(vk_shift) && keyboard_check_pressed(vk_tab))
{
	// Toggles debug menu
	global.active_debug_menu = !global.active_debug_menu;
	show_debug_log(global.active_debug_menu);
}

// Checks if the menu is active
if (global.active_debug_menu)
{
	// Calls custom function to set string information about the states to object variables
	game_state = get_gamestate();
	interior_state = get_interiorstate();
}