return {
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    lazy = false,
    config = function()
      require("github-theme").setup({})
      vim.cmd("colorscheme github_light")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
    },
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      icons = true,
      use_diagnostic_signs = true,
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
    },
  },
}
