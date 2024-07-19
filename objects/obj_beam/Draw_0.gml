// Draws the main beam body
draw_self();
// Draws the top beam head sprite flipped
draw_sprite_ext(spr_beam_head, 0, x, y - 128 - 22, 1, 1, 180, image_blend, image_alpha);
// Draws the bottom beam head sprite normally 
draw_sprite(spr_beam_head, 0, x, y + 128 + 22);