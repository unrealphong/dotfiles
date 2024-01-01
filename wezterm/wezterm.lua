local wezterm = require("wezterm")
local colors = require("themes/rose-pine").colors()

return {

	font = wezterm.font("JetBrainsMono NF", { weight = "Medium", stretch = "Normal", style = "Normal" }),

	font_rules = {
		{
			italic = true,
			font = wezterm.font("JetBrainsMono NF", { weight = "Medium", stretch = "Normal", style = "Italic" }),
		},
		{
			intensity = "Bold",
			font = wezterm.font("JetBrainsMono NF", { weight = "Bold", stretch = "Normal", style = "Normal" }),
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font("JetBrainsMono NF", { weight = "Bold", stretch = "Normal", style = "Italic" }),
		},
	},

	font_size = 16,

	colors = colors,
	initial_rows = 40,
	initial_cols = 120,
	window_padding = {
		left = 15,
		right = 15,
		top = 10,
		bottom = 0,
	},

	window_background_opacity = 0.92,
	window_decorations = "RESIZE",
	enable_tab_bar = false,
	scrollback_lines = 5000,
	enable_scroll_bar = false,
	check_for_updates = false,
}
