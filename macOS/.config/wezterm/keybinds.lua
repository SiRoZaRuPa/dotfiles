local wezterm = require("wezterm")

return {
	-- Option+- で水平分割
	{
		key = "-",
		mods = "OPT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Option+| で垂直分割
	{
		key = "|",
		mods = "OPT|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Option+矢印キーでペイン移動
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "OPT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	-- Option+x でペインを閉じる
	{
		key = "x",
		mods = "OPT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}
