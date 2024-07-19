draw_self();

draw_set_font(fnt_rowdies_22);

var _text_colour = make_color_rgb(142, 214, 67);

draw_set_color(_text_colour);
	
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (!is_warping && has_dropped)
{
	text_alpha = lerp(text_alpha, 1.0, 0.01);
	draw_set_alpha(text_alpha);
	
	var _string = parse_value(flag_distance) + "M";
	var _text_scale = clamp(80 / string_width(_string), 0.5, 1.0);
	
	draw_text_ext_transformed(x + 50, y - 195, _string, 10, 300, _text_scale, _text_scale, text_alpha);
}

draw_set_color(c_white);
draw_set_alpha(1.0);
	
draw_set_halign(fa_left);
draw_set_valign(fa_top);