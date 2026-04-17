return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false, -- needed so `nvim <dir>` opens directly into oil
    keys = {
      { "-", function() require("oil").open() end, desc = "Open parent directory (oil)" },
    },
    opts = {
      -- nvim-tree still owns netrw hijack; oil is opt-in via `-`.
      default_file_explorer = false,
      view_options = { show_hidden = true },
      keymaps = {
        ["q"] = "actions.close",
      },
    },
  },
}
