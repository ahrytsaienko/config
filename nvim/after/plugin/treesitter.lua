require('nvim-treesitter').setup()

require('nvim-treesitter').install({
  "vimdoc", "javascript", "typescript", "c",
  "lua", "rust", "go", "python", "terraform", "json",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
