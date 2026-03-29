-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.automatically_reload_config = true

-- -- 設定ファイルがあるディレクトリを Lua の検索パスに追加する
-- -- WEZTERM_CONFIG_FILE で指定されたパスの親ディレクトリを取得します
if os.getenv("WEZTERM_CONFIG_FILE") then
	local config_dir = os.getenv("WEZTERM_CONFIG_FILE"):match("(.*[/\\])")
	package.path = package.path .. ";" .. config_dir .. "?.lua"
end

local git_bash_path = "C:\\Program Files\\Git\\bin\\sh.exe"
config.default_prog = { git_bash_path, "--login", "-i" }

-- IME
config.use_ime = true

-- 見た目
-- config.front_end = "WebGpu"

-- font
config.font = wezterm.font_with_fallback({ "Monaspace Neon NF" })
config.font_size = 14.0

require("keymaps").apply_to_config(config)
require("appearance").apply_to_config(config)
require("statusbar").apply_to_config(config)
require("tab").apply_to_config(config)
require("workspace").apply_to_config(config)
require("background").apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
