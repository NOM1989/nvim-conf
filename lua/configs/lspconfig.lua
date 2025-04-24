require("nvchad.configs.lspconfig").defaults()

-- local old_servers = {
--   "astro",
--   "ts_ls",
--   "clangd",
--   "solargraph",
--   "jdtls",
--   "hls",
--   "prismals",
--   "tailwindcss",
--   "sqlls",
-- }

local servers = {
  html = {},
  cssls = {},
  lua_ls = {},
  bashls = {},

  pyright = {
    settings = {
      pyright = {
        -- Using Ruff's import organiser instead
        disableOrganizeImports = true,
      },
    },
  },
}

-- Custom config --

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == "ruff" then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = "LSP: Disable hover capability from Ruff",
})

-- custom diagnostic format, not sure why this didnt work in init.lua but here we are.
local diagnostic_formatter = function(diagnostic)
  -- gsub is to remove a . if present at end of source
  return string.format("%s [%s]", diagnostic.message, diagnostic.source:gsub("%.$", ""))
end

vim.diagnostic.config {
  -- see :help vim.diagnostic.config()
  virtual_text = {
    format = diagnostic_formatter,
  },
  signs = true,
  -- update_in_insert = false,
  severity_sort = true,
}
-- End of custom format

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end
