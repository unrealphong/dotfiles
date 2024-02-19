local wezterm = require("wezterm")
local Config = require("config")

require("events.tab-title").setup()
require("events.right-status").setup()

return Config:init()
	:append(require("config.font"))
	:append(require("config.maps"))
	:append(require("config.appearance")).options
