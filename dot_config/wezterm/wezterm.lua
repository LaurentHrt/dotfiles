local wezterm = require("wezterm")
local utils = require("utils")
local mux = wezterm.mux

wezterm.on("gui-attached", function(_)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

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
config.use_ime = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

local imageFiles = utils.filterImageFiles(wezterm.read_dir(wezterm.home_dir .. "/.config/wezterm/wallpapers/"))
local randomFilename = utils.getRandomElement(imageFiles)
if randomFilename ~= nil then
	config.background = {
		{
			source = { File = randomFilename },
			hsb = {
				brightness = 0.25,
			},
		},
	}
end

-- and finally, return the configuration to wezterm
return config
