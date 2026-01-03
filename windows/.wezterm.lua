-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true

-- keybinds
-- config.keys = require("keybinds")

local git_bash_path = "C:\\Program Files\\Git\\bin\\sh.exe"
config.default_prog = { git_bash_path, "--login", "-i" }

-- IME
config.use_ime = true

-- 見た目
config.font = wezterm.font_with_fallback({ "Bizin Gothic NF" })
config.font_size = 14.0
-- config.window_background_opacity = 0.75
config.macos_window_background_blur = 15
config.color_scheme = "Catppuccin Frappé (Gogh)"

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.window_background_image = "D:/ピクチャ/videoframe_45111.png"

config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.03,
	hue = 1.0,
	saturation = 0.6,
}
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

-- タブバー
config.window_frame = {
	active_titlebar_bg = "rgba(0, 0, 0, 0)", -- タブバー背景を透過
	inactive_titlebar_bg = "rgba(0, 0, 0, 0)", -- タブバー背景を透過
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	local edge_background = "none"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end

	local edge_foreground = background

	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- and finally, return the configuration to wezterm
return config
