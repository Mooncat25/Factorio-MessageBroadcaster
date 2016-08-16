local function extract_monolith(ff, xx, yy, ww, hh)
	return
	{
		type = "monolith",
		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,
		monolith_image =
		{
			filename = "__message-broadcaster__/graphics/" .. ff,
			priority = "extra-high-no-scale",
			width = ww,
			height = hh,
			x = xx,
			y = yy,
		},
	}
end

data.raw["gui-style"].default.small_message_hint_panel_button_style = 
{
    type = "button_style",
	parent = "button_style",
	scalable = false,
	top_padding = 0,
	right_padding = 0,
	bottom_padding = 0,
	left_padding = 0,
	width = 20,
	height = 20,
	default_graphical_set = extract_monolith("message-hint-panel.png", 0, 0, 20, 20),
	hovered_graphical_set = extract_monolith("message-hint-panel.png", 20, 0, 20, 20),
	clicked_graphical_set = extract_monolith("message-hint-panel.png", 40, 0, 20, 20),
}