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
		-- 引数がディレクトリ（例: nvim .）の場合
		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			-- 現在の空のディレクトリバッファを記録
			local dir_buf = vim.api.nvim_get_current_buf()

			-- 1. Neo-tree をフォーカスして開く
			require("neo-tree.command").execute({ action = "focus", source = "filesystem" })

			-- 2. 不要になったディレクトリバッファを削除する
			-- これにより、メインウィンドウから [No Name]（ディレクトリバッファ）が消えます
			vim.api.nvim_buf_delete(dir_buf, { force = true })

		-- 引数なしで起動した場合
		elseif vim.fn.argc() == 0 then
			require("neo-tree.command").execute({ action = "focus", source = "filesystem" })
		end
	end,
})
