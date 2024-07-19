// Vérifie que le jeu n'est pas en pause
if (obj_game_manager.current_game_state != GAME_STATE.PAUSED)
{
    // Synchronise la vitesse de défilement avec le mouvement du personnage
    bg_x -= obj_game_manager.current_speed * background_move_rate;

    // Assure une boucle sans couture
    if (bg_x <= -sprite_get_width(sprite_index))
    {
        // Déplace la position x vers l'avant de la largeur du sprite pour maintenir les positions de dessin correctes
        bg_x += sprite_get_width(sprite_index);
        
        // Cycle through the sprites
        before_sprite = sprite_index;
        sprite_index = after_sprite;
        after_sprite = before_sprite;  // Cette ligne assure un cycle continu
    }
    if (bg_x >= sprite_get_width(sprite_index))
    {
        // Déplace la position x vers l'arrière de la largeur du sprite pour maintenir les positions de dessin correctes
        bg_x -= sprite_get_width(sprite_index);
        
        // Cycle through the sprites
        after_sprite = sprite_index;
        sprite_index = before_sprite;
        before_sprite = after_sprite;  // Cette ligne assure un cycle continu
    }
}
