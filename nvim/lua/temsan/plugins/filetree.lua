return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", function() require("nvim-tree.api").tree.toggle() end,                           desc = "Toggle file explorer" },
      { "<leader>r", function() require("nvim-tree.api").tree.find_file({ open = true, focus = true }) end, desc = "Reveal current file in explorer" },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
      sort_by = "case_sensitive",
      view = {
        width = 35,
        relativenumber = true,
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = { git = true, folder = true, file = true, folder_arrow = true },
        },
      },
      filters = { dotfiles = false },
      git = { enable = true, ignore = false },
      update_focused_file = { enable = true, update_cwd = true },
      actions = {
        open_file = { quit_on_open = false, resize_window = true },
      },
    },
  },
}
