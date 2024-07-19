// Draw banner sprite
draw_self();

// Setup heading font
draw_set_font(fnt_rowdies_56);

// Set heading colour
var _text_colour = make_color_rgb(142, 214, 67);
draw_set_color(_text_colour);
// Set heading alpha
draw_set_alpha(image_alpha);
// Set alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw heading text
draw_text(room_width * 0.5, room_height * 0.28, "PAUSED");

// Reset draw values
draw_set_color(c_white);
draw_set_alpha(1.0);

// Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);