// Stores the midground sprites inside an array
sprite[0] = spr_midground_1;
sprite[1] = spr_midground_2;
sprite[2] = spr_midground_3;
sprite[3] = spr_midground_4;

// Prefeches them to prevent hanging later
sprite_prefetch_multi(sprite);

// Sets before, current and after sprite from array
before_sprite = sprite[0];
sprite_index = sprite[1];
after_sprite =sprite[2];

// Sets new random x position
x = random_range(0, sprite_width);
// Sets y position
y = 0;

// Sets parallaxing move rate
background_move_rate = 0.8;