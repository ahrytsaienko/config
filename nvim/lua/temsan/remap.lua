-- ============================================================================
-- 🎹 Keymaps / Remaps
-- ============================================================================
-- All mappings use <Space> as the leader key (see set.lua)
-- To check mappings: :map or :verbose map <key>
-- ============================================================================

local builtin = require('telescope.builtin')

-- --------------------------------------------------------------------------
-- 🧱 Basic Editing
-- --------------------------------------------------------------------------
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode quickly" })

-- Visual mode paste without replacing register
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without yanking" })

-- --------------------------------------------------------------------------
-- 🪟 Window Management
-- --------------------------------------------------------------------------
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- --------------------------------------------------------------------------
-- 📁 File Explorer
-- --------------------------------------------------------------------------
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer (:Ex)" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- --------------------------------------------------------------------------
-- 🔍 Telescope Search
-- --------------------------------------------------------------------------
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git-tracked files" })
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Search string in project (live grep)" })

-- --------------------------------------------------------------------------
-- 🧠 LSP Actions
-- --------------------------------------------------------------------------
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format current file with LSP" })
