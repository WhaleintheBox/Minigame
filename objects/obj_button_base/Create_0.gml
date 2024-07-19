// States for button
is_hovered = false;
is_pushed = false;

// Scale button is targeting
target_scale = 1.0;

// State for if button has snap scaling or not
can_scale_at_rate = false;

// Set rates for scaling up and down
scale_up_rate = 0.1;
scale_down_rate = 0.5;

// Values for scale sizes
scale_highlighted = 1.05;
scale_pressed = 0.95;
scale_default = 1.00;

// State for if panel sprite should be drawn behind the button object
has_panel = false;

// Function to be set that will changed the functionality of the button when activated
target_function = function()
{
}