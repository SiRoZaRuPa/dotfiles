-- lua/plugins/editor/explorer.lua
return {
	-- 1. snacks.explorer を完全に無効化する
	{
		"folke/snacks.nvim",
		opts = {
			explorer = { enabled = false }, -- ここで明示的に無効化します
		},
	},

	-- 2. neo-tree の設定
	-- LazyVim の組み込み設定（Extras）を利用するのが最も簡単で確実です
	{ import = "lazyvim.plugins.extras.editor.neo-tree" },

	-- もし詳細なカスタマイズを自分で行いたい場合は、
	-- 既存の neo-tree 設定を以下のように調整します
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<leader>t",
				function()
					require("neo-tree.command").execute({ action = "focus", reveal = true })
				end,
				desc = "Focus Explorer (Neo-tree)",
			},
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ action = "focus", reveal = true })
				end,
				desc = "Focus Explorer (Neo-tree)",
			},
			{
				"<leader>fe",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
				end,
				desc = "Explorer NeoTree (Root Dir)",
			},
			{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
		},
		opts = {
			filesystem = {
				-- netrw関連
				hijack_netrw_behavior = "open_default",
				-- 隠しファイルをデフォルトで表示する設定
				filtered_items = {
					visible = true, -- これをtrueにすると、以下の非表示設定が反映されます
					hide_dotfiles = false, -- ドットファイル(隠しファイル)を表示
					hide_gitindexed = false, -- gitで無視されているファイルも表示したい場合はfalse
					hide_by_name = {
						-- 特定のファイル名だけ隠したい場合はここに記述
						-- ".DS_Store",
						-- "thumbs.db",
					},
				},
				follow_current_file = {
					enabled = true, -- 現在開いているファイルに自動で追従する
				},
				use_libuv_file_watcher = true,
			},
		},
	},
}
