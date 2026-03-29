return {
  "saghen/blink.cmp",
  -- LazyVimの設定と適切にマージするために opts を使用
  opts = {
    keymap = {
      -- 'super-tab' プリセット:
      --   Tab: 選択 & 決定
      --   S-Tab: 前の候補
      --   C-j/k: 候補移動(環境による)
      preset = "super-tab",

      -- 【重要】Enterキーの挙動を上書き
      -- super-tabでもEnterが決定に割り当てられる場合があるため、
      -- 明示的に「fallback（何もしない＝改行）」のみに設定します。
      ["<CR>"] = { "fallback" },
    },
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
  },
}
