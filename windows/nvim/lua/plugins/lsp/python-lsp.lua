return {
  -- LSP設定
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                -- pycodestyle設定
                pycodestyle = {
                  enabled = true,
                  ignore = { "E501" },
                  maxLineLength = 120,
                },
              },
            },
          },
        },
      },
    },
  },

  -- Mason設定
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "python-lsp-server",
      },
    },
  },
}
