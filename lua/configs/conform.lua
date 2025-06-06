local options = {
  formatters_by_ft = {
    lua = { "stylua", lsp_format = "fallback" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    astro = { "prettier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    bib = { "bibtex-tidy" },
    zsh = { "beautysh" },
  },

  -- Old ones:
  -- ruby = { "rubocop" },
  -- -- haml = { "haml_lint" },
  -- ["*"] = { "codespell" },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
