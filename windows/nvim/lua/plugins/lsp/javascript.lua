return {
	-- 1. LSP設定 (HTML, JS, CSS)
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = {},
				vtsls = {},
				cssls = {},
			},
		},
	},

	-- 2. Treesitterのインデント機能を確実にする
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "html", "javascript", "css" },
			indent = { enabled = true }, -- 構文に基づいたインデントを有効化
		},
	},

	-- 3. 自動タグクローズとタグ名リネーム
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	-- 4. 改行時のインデント制御 (nvim-autopairs)
	-- タグの間でEnterを押した際に、中間にインデントされた行を作成します
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true, -- Treesitterを使用してコンテキストを判断
			enable_check_bracket_line = false,
		},
	},

	-- 5. Mason設定
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"html-lsp",
				"vtsls",
				"eslint",
				"css-lsp",
			},
		},
	},
}
