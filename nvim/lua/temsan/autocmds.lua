-- Strip trailing whitespace on save, except where whitespace is semantic.
local trim_skip = { markdown = true, diff = true, patch = true, gitcommit = true, mail = true }
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    if trim_skip[vim.bo[args.buf].filetype] then return end
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})
