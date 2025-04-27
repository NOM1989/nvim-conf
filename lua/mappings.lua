require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})

-- load the session for the current directory
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore Session" })

-- Floating diagnostic
map("n", "ff", function()
  vim.diagnostic.open_float { border = "rounded", close_events = { "CursorMoved" } }
end, { desc = "Floating diagnostic" })

-- Move line(s)
map("n", "<A-Up>", "ddkP", {desc = "Move line up"} )
map("n", "<A-Down>", "ddp", {desc = "Move line down"} )
map("v", "<A-Up>", ":m-2<CR>gv=gv", { desc = "Move line up" })
map("v", "<A-Down>", ":m'>+<CR>gv=gv", { desc = "Move line down" })

map("i", "<C-BS>", "<C-w>", { desc = "Delete word" })
