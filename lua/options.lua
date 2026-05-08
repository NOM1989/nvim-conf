require "nvchad.options"

local o = vim.o

o.number = true
o.relativenumber = true

o.scrolloff = 7
-- o.sidescroll=1

local g = vim.g
if g.neovide then
  -- Put anything you want to happen only in Neovide here
  o.guifont = "JetBrainsMono NF:h18"
  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
  vim.keymap.set(
    { "n", "v" },
    "<C-ScrollWheelUp>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>"
  )
  vim.keymap.set(
    { "n", "v" },
    "<C-ScrollWheelDown>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>"
  )
  -- vim.keymap.set({ "c" }, "<D-v>", '<C-r>+', { desc = "Paste system clipboard" })
end

local autocmd = vim.api.nvim_create_autocmd

-- Restore cursor to Beam (blinking) on leave.
autocmd({ "VimLeave", "VimSuspend" }, {
  pattern = { "*" },
  callback = function()
    o.guicursor = "a:ver100,a:blinkon1"
  end,
})

o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"
