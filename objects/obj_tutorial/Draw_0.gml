// Draws the banner
draw_self();

// Sets up the font
draw_set_font(fnt_rowdies_56);

// Sets up the text colour
var _text_colour = make_color_rgb(142, 214, 67);
draw_set_color(_text_colour);
// Sets up the text alpha
draw_set_alpha(image_alpha);

// Sets up the text alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draws the text heading
draw_text(room_width * 0.5, room_height * 0.28, "HOW TO PLAY");

// Setup for the tips body text
draw_set_font(fnt_rowdies_34);
draw_set_color(c_white);
draw_set_alpha(image_alpha);

// Draws the body message
draw_text(room_width * 0.5, room_height * 0.56, tip_message);

// Resets alighnment
draw_set_halign(fa_left);
draw_set_valign(fa_top);