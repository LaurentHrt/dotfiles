-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = "tokyonight"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_image = '/Users/laurenthirth/Downloads/aloy-4k-horizon-zero-dawn-m9.jpeg'
config.window_background_image_hsb = {
	brightness = 0.3,
}
-- and finally, return the configuration to wezterm
return config
