local wezterm = require("wezterm")
local padding = 40
return {
	 scrollback_lines = 10000,
    enable_tab_bar = false,
    audible_bell = "Disabled",
    line_height = 1.4,
    adjust_window_size_when_changing_font_size = false,
    window_decorations = "RESIZE",
    window_close_confirmation = "NeverPrompt",
    color_scheme = "Night Owl (Gogh)",
    window_padding = {
        left = padding,
        right = padding,
        top = padding,
        bottom = padding,
    },
}
