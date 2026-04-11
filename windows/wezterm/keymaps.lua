local wezterm = require("wezterm")

local act = wezterm.action

local module = {}

local leader = { key = "q", mods = "CTRL", timeout_milliseconds = 2000 }

local keys = {
	{ key = ":", mods = "CTRL", action = act.PaneSelect },
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) }, -- Control+q → r 横分割
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }, -- Control+q → d 縦分割
	{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) }, -- Control+q → x ペインを閉じる
}

function module.apply_to_config(config)
	config.keys = keys
	config.leader = leader
end

return module
