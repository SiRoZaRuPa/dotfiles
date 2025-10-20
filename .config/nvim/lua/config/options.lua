-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt

-- インデント設定
opt.tabstop = 4 -- タブ文字の幅
opt.shiftwidth = 4 -- 自動インデントの幅
opt.softtabstop = 4 -- タブキー押下時の幅
opt.expandtab = true -- タブをスペースに展開
opt.smartindent = true -- スマートインデント
opt.autoindent = true -- 自動インデント

-- カーソル設定（insertモードでもブロック型）
opt.guicursor = "" -- すべてのモードでブロックカーソル
