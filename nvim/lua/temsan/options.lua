-- Leader (must be set before lazy.nvim loads plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Text layout
opt.wrap = false
opt.linebreak = true
opt.colorcolumn = "120"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Files / undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = false
opt.cursorline = false
opt.cmdheight = 1

-- Clipboard
opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Responsiveness
opt.updatetime = 250
opt.timeoutlen = 300

-- Mouse
opt.mouse = "a"

-- Completion menu
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10

-- Whitespace
opt.list = false

-- Path / wildmenu
opt.path:append("**")
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({
  "*/node_modules/*", "*/.git/*", "*.pyc", "*.o", "*.swp", "*.zip", "*/.DS_Store",
})

-- Status
opt.showcmd = true
opt.ruler = true
opt.laststatus = 3

-- Diff
opt.diffopt:append("vertical")

-- Misc
opt.iskeyword:append("-")
opt.formatoptions:remove({ "c", "r", "o" })
opt.shortmess:append("c")
