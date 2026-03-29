local wezterm = require("wezterm")
local module = {}

local background = {
	window_background_image = "D:/ピクチャ/videoframe_45111.png",
	--
	window_background_image_hsb = {
		-- Darken the background image by reducing it to 1/3rd
		brightness = 1.0,
		hue = 1.0,
		saturation = 0.6,
	},

	window_background_opacity = 0.05,
	win32_system_backdrop = "Tabbed",
}

function module.apply_to_config(config)
	for k, v in pairs(background) do
		config[k] = v
	end
end

return module
