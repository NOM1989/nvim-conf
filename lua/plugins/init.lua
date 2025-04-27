return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    opts = require "configs.lspconfig",
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
    },
  },

  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    lazy = true,
  },

  -- Persistence for nvim sessions (per workspace)
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
    lazy = true,
  },

  { "nvzone/menu", lazy = true },

  {
    "supermaven-inc/supermaven-nvim",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<C-Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {

      {
        "hrsh7th/cmp-cmdLine",
        event = "CmdlineEnter",
        config = function()
          local cmp = require "cmp"

          cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } },
          })

          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
            }),
          })
        end,
      },
    },
  },
}
