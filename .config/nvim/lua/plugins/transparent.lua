return {
  "xiyaowong/transparent.nvim",
  lazy = false,
  opts = {
    extra_groups = {
      "NormalFloat", -- フローティングウィンドウ
      "NvimTreeNormal", -- NvimTree
      "TelescopeNormal", -- Telescope
      "WhichKeyFloat",
    },
  },
  config = function(_, opts)
    require("transparent").setup(opts)
    require("transparent").clear_prefix("lualine")
  end,
}
