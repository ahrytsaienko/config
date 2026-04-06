require('nvim-treesitter').setup({
  ensure_installed = {
    "vimdoc", "javascript", "typescript", "c",
    "lua", "rust", "go", "python", "terraform",
  },
  auto_install = true,
})

-- Enable treesitter highlighting for all filetypes
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
