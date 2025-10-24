-- ============================================================================
-- 🌳 Nvim-Tree Configuration
-- ============================================================================
-- A simple, fast file explorer written in Lua.
-- This file is auto-loaded *after* packer loads the plugin.
-- ============================================================================

-- Safely require nvim-tree
local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("nvim-tree not found!", vim.log.levels.WARN)
  return
end

-- Disable netrw (the built-in file explorer)
-- This prevents conflicts with nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable true colors (for devicons)
vim.opt.termguicolors = true

-- Setup configuration
nvim_tree.setup({
  sort_by = "case_sensitive",       -- Sort files alphabetically (case sensitive)
  view = {
    width = 35,                     -- Sidebar width
    relativenumber = true,          -- Show relative numbers in tree
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,             -- Compact empty folders
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = false,               -- Show dotfiles (set true to hide)
  },
  git = {
    enable = true,                  -- Show git status in the tree
    ignore = false,
  },
  update_focused_file = {
    enable = true,                  -- Highlight file in tree when switching buffers
    update_cwd = true,
  },
  actions = {
    open_file = {
      quit_on_open = false,         -- Keep the tree open when opening a file
      resize_window = true,
    },
  },
})

-- ============================================================================
-- 🔑 Keymaps
-- ============================================================================

-- Toggle file explorer
vim.keymap.set("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file explorer" })

-- Reveal current file in tree
vim.keymap.set("n", "<leader>r", function()
  require("nvim-tree.api").tree.find_file({ open = true, focus = true })
end, { desc = "Reveal current file in explorer" })

-- ============================================================================
-- 🪄 Optional: Auto open tree when launching Neovim with no file
-- ============================================================================

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    -- open nvim-tree only if no file or directory is given
    if vim.fn.isdirectory(data.file) ~= 0 or data.file == "" then
      require("nvim-tree.api").tree.open()
    end
  end,
})
