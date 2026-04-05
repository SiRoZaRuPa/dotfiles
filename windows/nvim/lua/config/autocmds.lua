-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- -- 起動時に neo-tree を自動展開する
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- 1. 引数なしで起動した場合、またはディレクトリを指定して起動した場合に実行
		if vim.fn.argc() == 0 or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			require("neo-tree.command").execute({ action = "focus", source = "filesystem" })
		end
	end,
})
