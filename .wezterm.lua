-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}


config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.color_scheme = "Catppuccin Mocha"

config.window_padding = {
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
