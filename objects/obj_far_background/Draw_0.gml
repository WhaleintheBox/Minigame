// Dessiner le sprite avant à une position décalée de moins sa largeur
draw_sprite(before_sprite, 0, bg_x - sprite_get_width(before_sprite), y);

// Dessiner le sprite principal/milieu
draw_sprite(sprite_index, 0, bg_x, y);

// Dessiner le sprite final à une position décalée de sa largeur
draw_sprite(after_sprite, 0, bg_x + sprite_get_width(sprite_index), y);
