/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
// Animation de mouvement de droite à gauche pour spr_title
if (instance_exists(spr_title))
{
    global.title_timer += global.title_speed;
    var title_instance = instance_find(spr_title, 0);
    title_instance.x = global.title_start_x + sin(global.title_timer) * global.title_amplitude;
}
