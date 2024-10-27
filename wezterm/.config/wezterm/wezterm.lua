local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 15

config.color_scheme = 'Tokyo Night'

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8

return config
