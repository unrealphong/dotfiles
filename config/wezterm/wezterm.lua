local wezterm = require("wezterm")
local action = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = 'rose-pine-moon'
config.window_decorations = "RESIZE"
config.font = wezterm.font("MartianMono Nerd Font", { weight = "Regular", stretch = "Normal" })
config.font_size = 12

config.window_padding = {
	left = 24,
	right = 24,
	top = 24,
	bottom = 16,
}

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.pane_select_font_size = 36
config.keys = {
	{
		key = "b",
		mods = "CMD",
		action = action({ PaneSelect = {} }),
	},
	{
		key = "{",
		mods = "SHIFT|ALT",
		action = action.MoveTabRelative(-1),
	},
	{
		key = "}",
		mods = "SHIFT|ALT",
		action = action.MoveTabRelative(1),
	},
	{
		key = "w",
		mods = "CMD",
		action = action.CloseCurrentPane({
			confirm = true,
		}),
	},
	{
		key = "W",
		mods = "CMD|SHIFT",
		action = action.CloseCurrentTab({
			confirm = true,
		}),
	},
	{
		key = "d",
		mods = "CMD",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "z",
		mods = "CMD",
		action = action.TogglePaneZoomState,
	},
	{
		key = "`",
		mods = "CMD",
		action = action.ToggleAlwaysOnTop,
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

config.colors = {
	foreground = "rgba(219, 215, 202, 0.93)",
	background = "#121212",
	cursor_fg = "#222222",
	selection_fg = "rgba(219,215,202,0.93)",
	selection_bg = "rgba(238, 238, 238, 0.094)",
	scrollbar_thumb = "rgba(222, 220, 213, 0.063)",
	split = "#252525",
	ansi = { "#393a34", "#cb7676", "#4d9375", "#e6cc77", "#6394bf", "#d9739f", "#5eaab5", "#dbd7ca" },
	brights = { "#777777", "#cb7676", "#4d9375", "#e6cc77", "#6394bf", "#d9739f", "#5eaab5", "#ffffff" },
	indexed = {
		[136] = "#bd976a",
	},
	compose_cursor = "#d4976c",
	copy_mode_active_highlight_bg = {
		Color = "#292929",
	},
	copy_mode_active_highlight_fg = {
		Color = "rgba(219, 215, 202, 0.93)",
	},
	copy_mode_inactive_highlight_bg = {
		Color = "#4d9375",
	},
	copy_mode_inactive_highlight_fg = {
		Color = "#222222",
	},
	quick_select_label_bg = {
		Color = "#4d9375",
	},
	quick_select_label_fg = {
		Color = "#222222",
	},
	quick_select_match_bg = {
		Color = "#6394bf",
	},
	quick_select_match_fg = {
		Color = "#222222",
	},
	tab_bar = {
		background = "#121212",
		inactive_tab = {
			bg_color = "#121212",
			fg_color = "#393a34",
		},
		inactive_tab_hover = {
			bg_color = "#121212",
			fg_color = "rgba(219, 215, 202, 0.93)",
		},
		new_tab = {
			bg_color = "#121212",
			fg_color = "#393a34",
		},
		new_tab_hover = {
			bg_color = "#121212",
			fg_color = "rgba(219, 215, 202, 0.93)",
		},
		active_tab = {
			bg_color = "#121212",
			fg_color = "rgba(219, 215, 202, 0.93)",
		},
	},
}

config.window_background_opacity = 0.96
config.inactive_pane_hsb = {
	saturation = 0.75,
	brightness = 0.5,
}

return config
