-- Leader key
vim.g.mapleader = " "

-- Line numbers
vim.opt.number = true         -- absolute line number on current line
vim.opt.relativenumber = true -- relative numbers on other lines

-- Tabs / indentation
vim.opt.tabstop = 2        -- show existing TABs as 2 spaces
vim.opt.softtabstop = 2    -- number of spaces inserted on <Tab>
vim.opt.shiftwidth = 2     -- indent width for >> and << and autoindent
vim.opt.expandtab = true   -- convert TAB to spaces
vim.opt.smartindent = true -- autoindent new lines

-- Text layout / UI feel
vim.opt.wrap = false        -- don't soft wrap long lines
vim.opt.colorcolumn = "120" -- visual ruler at 120 chars
vim.opt.scrolloff = 8       -- keep 8 lines of context when scrolling vertically
vim.opt.sidescrolloff = 8   -- keep context when scrolling horizontally

-- Files / undo / backups
vim.opt.swapfile = false -- no swap files
vim.opt.backup = false   -- no backup files
vim.opt.undofile = true  -- persistent undo across sessions

-- Search
vim.opt.hlsearch = false  -- don't highlight all matches after search
vim.opt.incsearch = true  -- live incremental search
vim.opt.ignorecase = true -- case-insensitive search...
vim.opt.smartcase = true  -- ...unless you type uppercase

-- Appearance / colors / signs
vim.opt.termguicolors = true -- true color in terminal
vim.opt.signcolumn = "yes"   -- always show sign column (git/LSP)
vim.opt.showmode = false     -- hide -- INSERT --, lualine shows mode instead

-- Clipboard / encoding
vim.opt.clipboard = "unnamedplus" -- yank/paste uses system clipboard
vim.opt.encoding = "utf-8"        -- make sure we're in UTF-8 land

-- Window / splits
vim.opt.splitright = true -- :vsplit opens to the right
vim.opt.splitbelow = true -- :split opens below

-- Perf / responsiveness
vim.opt.updatetime = 50  -- faster CursorHold (used by gitsigns, LSP)
vim.opt.timeoutlen = 300 -- shorter timeout for mapped sequences

-- Mouse (optional: comment out if you want pure keyboard life)
vim.opt.mouse = "a" -- enable mouse support
