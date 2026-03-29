return {
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = true,
		config = function()
			require("github-theme").setup({
				-- お好みのオプション
			})
			vim.cmd.colorscheme("github_dark_default")
		end,
	},
	-- 起動時のデフォルト設定に使用したい場合は下記を有効化する
	-- {
	--   "LazyVim/LazyVim",
	--   opts = {
	--     colorscheme = "catppuccin",
	--   },
	-- },
}
