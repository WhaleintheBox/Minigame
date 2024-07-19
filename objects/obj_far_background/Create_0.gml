// Crée un tableau et y stocke les sprites de fond
sprites[0] = spr_farground_1;
sprites[1] = spr_farground_2;
sprites[2] = spr_farground_3;

// Précharge les sprites dans les ressources système
sprite_prefetch_multi(sprites);

// Initialise les variables des sprites à partir du tableau
before_sprite = sprites[0];
sprite_index = sprites[1];
after_sprite = sprites[2];

// Initialise les coordonnées
x = 0;
y = 0;

// Définit le taux de déplacement pour l'effet de parallaxe
background_move_rate = 0.4;

// Variables supplémentaires pour le défilement
bg_x = 0;
bg_speed = 4;  // Vitesse par défaut, peut être ajustée
