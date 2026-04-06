-- ============================================================================
-- 🎹 Keymaps / Remaps
-- ============================================================================
-- All mappings use <Space> as the leader key (see set.lua)
-- To check mappings: :map or :verbose map <key>
-- ============================================================================

local builtin = require('telescope.builtin')
local keymap = vim.keymap.set

-- --------------------------------------------------------------------------
-- 🧱 Basic Editing
-- --------------------------------------------------------------------------
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode quickly" })

-- Visual mode paste without replacing register
keymap("x", "p", [["_dP]], { desc = "Paste over selection without yanking" })

-- --------------------------------------------------------------------------
-- 🪟 Window Management
-- --------------------------------------------------------------------------
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- Keep cursor centered when scrolling
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
keymap("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- --------------------------------------------------------------------------
-- 📁 File Explorer
-- --------------------------------------------------------------------------
keymap("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer (:Ex)" })

-- --------------------------------------------------------------------------
-- 🔍 Telescope Search
-- --------------------------------------------------------------------------
keymap("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
keymap("n", "<C-p>", builtin.git_files, { desc = "Find Git-tracked files" })
keymap("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Search string in project (live grep)" })

-- --------------------------------------------------------------------------
-- 🧠 LSP Actions
-- --------------------------------------------------------------------------
keymap("n", "<leader>f", vim.lsp.buf.format, { desc = "Format current file with LSP" })

-- --------------------------------------------------------------------------
-- 🛠️ Utility Commands
-- --------------------------------------------------------------------------
keymap("n", "<leader>so", "<cmd>source %<CR>", { desc = "Source current file" })
