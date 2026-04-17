return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "gr",         function() require("telescope.builtin").lsp_references() end },
      { "<leader>pf", function() require("telescope.builtin").find_files() end },
      { "<C-p>",      function() require("telescope.builtin").git_files() end },
      { "<leader>ps", function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end },
      { "<leader>vh", function() require("telescope.builtin").help_tags() end },
      { "<leader>pg", function() require("telescope.builtin").live_grep() end },
      { "<leader>pr", function()
        require("telescope.builtin").lsp_references({
          show_line = false,
          include_declaration = false,
          layout_strategy = "horizontal",
          layout_config = { width = 0.9, height = 0.5, preview_width = 0.6 },
          previewer = true,
        })
      end, desc = "Preview references with Telescope" },
      { "<leader>pd", function()
        require("telescope.builtin").lsp_definitions({
          layout_strategy = "horizontal",
          layout_config = { width = 0.9, height = 0.5, preview_width = 0.6 },
          previewer = true,
        })
      end, desc = "Preview definition with Telescope" },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      })
    end,
  },
}
