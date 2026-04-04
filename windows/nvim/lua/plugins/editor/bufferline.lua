return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			-- セパレータ
			separator_style = "slant",
			-- ホバー機能の有効化
			hover = {
				enabled = true,
				delay = 10,
				reveal = { "close" }, -- ホバー時に閉じるボタンを表示
			},
		},
	},
	init = function()
		-- マウスホバーイベントを取得するために必須の設定です
		vim.opt.mousemoveevent = true
	end,
}
