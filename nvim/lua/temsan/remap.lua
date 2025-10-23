local builtin = require('telescope.builtin')

vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")

-- Prevent `p` in visual mode from overwriting the default register
vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

