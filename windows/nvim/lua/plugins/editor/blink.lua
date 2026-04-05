-- windows/nvim/lua/plugins/editor/cmp.lua
return {
	"saghen/blink.cmp",
	-- LazyVimの設定と適切にマージするために opts を使用
	opts = {
		keymap = {
			preset = "super-tab",
			["<CR>"] = { "fallback" },
		},
		completion = {
			ghost_text = {
				enabled = false,
			},
			menu = {
				border = "rounded",
				-- 補完ウィンドウの描画設定をカスタマイズ
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", "source" }, -- "source" カラムを追加
					},
					components = {
						-- source コンポーネントの定義
						source = {
							text = function(ctx)
								-- ソース名の先頭3文字を大文字にして [LSP] などの形式にする
								return "[" .. ctx.source_name:sub(1, 3):upper() .. "]"
							end,
							highlight = "BlinkCmpSource", -- 必要に応じてハイライトグループを指定
						},
					},
				},
			},
			documentation = {
				window = {
					border = "rounded",
				},
			},
		},
		sources = {
			default = {
				-- ここに既定のソースリストがある場合はそれを維持してください
				-- 例: { 'lsp', 'path', 'snippets', 'buffer' }
				cmdline = {}, -- Disable cmdline completions
			},
		},
	},
}
