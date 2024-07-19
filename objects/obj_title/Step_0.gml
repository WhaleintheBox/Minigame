// Increment the timer
title_timer += title_speed;

// Update the x position using sine wave movement
x = title_start_x + sin(title_timer) * title_amplitude;

// Ensure the y position stays centered
y = title_start_y;
