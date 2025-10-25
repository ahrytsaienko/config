local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    }
  }
}

vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})

vim.keymap.set("n", "<leader>pr", function()
  builtin.lsp_references({
    show_line = false,
    include_declaration = false,

    -- force a horizontal layout with preview on the right
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.9,        -- take 90% of screen
      height = 0.5,       -- half the screen height
      preview_width = 0.6 -- 60% of that space = preview
    },

    previewer = true, -- <- THIS is the important one
  })
end, { desc = "Preview references with Telescope" })

vim.keymap.set("n", "<leader>pd", function()
  builtin.lsp_definitions({
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.9,
      height = 0.5,
      preview_width = 0.6,
    },
    previewer = true,
  })
end, { desc = "Preview definition with Telescope" })
