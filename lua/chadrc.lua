-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "bearded-arc",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "███╗   ██╗ ██████╗ ███╗   ███╗",
    "████╗  ██║██╔═══██╗████╗ ████║",
    "██╔██╗ ██║██║   ██║██╔████╔██║",
    "██║╚██╗██║██║   ██║██║╚██╔╝██║",
    "██║ ╚████║╚██████╔╝██║ ╚═╝ ██║",
    "╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝",
    "                              ",
    "         Welcome back         ",
    "                              ",
    -- "     Powered By  eovim    ",
    -- "         Nick  Michau         ",
    -- "                              ",
  },

  buttons = {
    { txt = "  Restore Session", keys = "qs", cmd = ":lua require('persistence').load()" },
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    -- { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return " Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}
M.ui = {
  tabufline = {
    lazyload = false,
    order = { "treeOffset", "buffers", "tabs" },
  },
  cmp = {
    lspkind_text = true,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false,
    },
  },
}

return M
