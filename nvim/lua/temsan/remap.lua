-- ============================================================================
-- 🎹 Keymaps / Remaps
-- ============================================================================
-- All mappings use <Space> as the leader key (see set.lua)
-- To check mappings: :map or :verbose map <key>
-- ============================================================================

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

-- File explorer: <leader>e (nvim-tree) and `-` (oil) — netrw is disabled.
-- Telescope pickers live in lua/temsan/plugins/telescope.lua.
-- <leader>f is owned by conform.nvim — see lua/temsan/plugins/format.lua

-- --------------------------------------------------------------------------
-- 🛠️ Utility Commands
-- --------------------------------------------------------------------------
keymap("n", "<leader>so", "<cmd>source %<CR>", { desc = "Source current file" })
