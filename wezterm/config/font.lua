local wezterm = require("wezterm")

return {
	font_size = 16,
	freetype_load_flags = "NO_HINTING", -- smoother font
    font = wezterm.font("JetBrainsMono Nerd Font Mono"),
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" }, --disable ligatures
}
