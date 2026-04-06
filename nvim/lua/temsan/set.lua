-- ============================================================================
-- ⚙️  Neovim Core Settings
-- ============================================================================
-- This file configures Neovim's built-in options for optimal editing experience
-- Load this from init.lua via: lua require('options')
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 👑 Leader Key
-- ----------------------------------------------------------------------------
-- Set leader key before any mappings (space is ergonomic and memorable)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ----------------------------------------------------------------------------
-- 🔢 Line Numbers
-- ----------------------------------------------------------------------------
vim.opt.number = true         -- Show absolute line number on current line
vim.opt.relativenumber = true -- Show relative numbers on other lines (great for motions like 5j)

-- ----------------------------------------------------------------------------
-- ⭐ Indentation & Tabs
-- ----------------------------------------------------------------------------
vim.opt.tabstop = 2        -- Display existing TABs as 2 spaces wide
vim.opt.softtabstop = 2    -- Number of spaces inserted when pressing <Tab>
vim.opt.shiftwidth = 2     -- Indent width for >> and << operators and autoindent
vim.opt.expandtab = true   -- Convert TAB key presses to spaces
vim.opt.smartindent = true -- Automatically indent new lines based on syntax

-- ----------------------------------------------------------------------------
-- 📐 Text Layout & Viewport
-- ----------------------------------------------------------------------------
vim.opt.wrap = false        -- Don't soft wrap long lines (horizontal scroll instead)
vim.opt.linebreak = true    -- If wrap is enabled, break at word boundaries
vim.opt.colorcolumn = "120" -- Visual ruler at column 120 (style guide marker)
vim.opt.scrolloff = 8       -- Keep 8 lines visible above/below cursor when scrolling
vim.opt.sidescrolloff = 8   -- Keep 8 columns visible left/right of cursor

-- ----------------------------------------------------------------------------
-- 💾 Files, Backups & Undo
-- ----------------------------------------------------------------------------
vim.opt.swapfile = false -- Disable swap files (annoying .swp files)
vim.opt.backup = false   -- Don't create backup files before overwriting
vim.opt.undofile = true  -- Enable persistent undo history across sessions

-- ----------------------------------------------------------------------------
-- 🔍 Search Behavior
-- ----------------------------------------------------------------------------
vim.opt.hlsearch = false  -- Don't highlight all matches after search completes
vim.opt.incsearch = true  -- Show matches incrementally as you type
vim.opt.ignorecase = true -- Case-insensitive search by default
vim.opt.smartcase = true  -- Override ignorecase if search contains uppercase letters

-- ----------------------------------------------------------------------------
-- 🎨 Appearance & UI
-- ----------------------------------------------------------------------------
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the terminal
vim.opt.signcolumn = "yes"   -- Always show sign column (prevents text shift from git/LSP signs)
vim.opt.showmode = false     -- Don't show mode (-- INSERT --) since lualine handles this
vim.opt.cursorline = false   -- Highlight the line the cursor is on
vim.opt.cmdheight = 1        -- Command line height (increase if you get "Press ENTER" prompts)

-- ----------------------------------------------------------------------------
-- 📋 Clipboard & Encoding
-- ----------------------------------------------------------------------------
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for yank/paste operations
vim.opt.encoding = "utf-8"        -- Default file encoding (should be UTF-8)
vim.opt.fileencoding = "utf-8"    -- Encoding written to files

-- ----------------------------------------------------------------------------
-- 🪟 Window Splits
-- ----------------------------------------------------------------------------
vim.opt.splitright = true -- Vertical splits open to the right
vim.opt.splitbelow = true -- Horizontal splits open below

-- ----------------------------------------------------------------------------
-- ⚡ Performance & Responsiveness
-- ----------------------------------------------------------------------------
vim.opt.updatetime = 250   -- Faster CursorHold events (used by gitsigns, LSP) - default is 4000ms
vim.opt.timeoutlen = 300   -- Timeout for mapped key sequences (affects which-key popup delay)
vim.opt.lazyredraw = false -- Don't skip screen redraws (keep false for modern Neovim)

-- ----------------------------------------------------------------------------
-- 🖱️ Mouse Support
-- ----------------------------------------------------------------------------
vim.opt.mouse = "a" -- Enable mouse in all modes (a = all, n = normal, v = visual, etc.)

-- ----------------------------------------------------------------------------
-- 📝 Completion Menu
-- ----------------------------------------------------------------------------
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Better completion experience
vim.opt.pumheight = 10                                  -- Limit popup menu height to 10 items

-- ----------------------------------------------------------------------------
-- 👁️ Whitespace Visualization
-- ----------------------------------------------------------------------------
vim.opt.list = false -- Hide invisible characters
-- Auto-cleanup trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- ----------------------------------------------------------------------------
-- 🔧 File & Path Configuration
-- ----------------------------------------------------------------------------
vim.opt.path:append("**")              -- Search recursively in subdirectories with :find
vim.opt.wildmenu = true                -- Enhanced command-line completion
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.wildignore:append({
  "*/node_modules/*",
  "*/.git/*",
  "*.pyc",
  "*.o",
  "*.swp",
  "*.zip",
  "*/.DS_Store"
})

-- ----------------------------------------------------------------------------
-- 📊 Status & Info
-- ----------------------------------------------------------------------------
vim.opt.showcmd = true -- Show partial command in status line
vim.opt.ruler = true   -- Show cursor position in status line
vim.opt.laststatus = 3 -- Global statusline (single statusline for all windows)

-- ----------------------------------------------------------------------------
-- 🔀 Diff Mode
-- ----------------------------------------------------------------------------
vim.opt.diffopt:append("vertical") -- Open diffs in vertical splits by default

-- ----------------------------------------------------------------------------
-- 🎯 Miscellaneous
-- ----------------------------------------------------------------------------
vim.opt.iskeyword:append("-")                   -- Treat dash-separated words as a single word object
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't auto-insert comment leaders
vim.opt.shortmess:append("c")                   -- Don't show completion menu messages

-- ============================================================================
-- ✅ Configuration Complete
-- ============================================================================
