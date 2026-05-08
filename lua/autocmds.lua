local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

-- Cleanup lingering files on Windows, see: https://github.com/neovim/neovim/issues/8587
-- VS(Code) Vim extension could be a cause.
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  group = vim.api.nvim_create_augroup("remove_shada_temp", { clear = true }),
  pattern = { "*" },
  callback = function()
    local status = 0
    for _, f in ipairs(vim.fn.globpath(vim.fn.stdpath "data" .. "/shada", "*tmp*", false, true)) do
      if vim.tbl_isempty(vim.fn.readfile(f)) then
        status = status + vim.fn.delete(f)
      end
    end
    if status ~= 0 then
      vim.notify("Could not delete empty temporary ShaDa files.", vim.log.levels.ERROR)
      vim.fn.getchar()
    end
  end,
  desc = "Delete empty temp ShaDa files",
})
