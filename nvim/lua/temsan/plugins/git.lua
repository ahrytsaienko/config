return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    keys = {
      { "<leader>gs", vim.cmd.Git,                desc = "Git status (fugitive)" },
      { "<leader>co", ":diffget LOCAL<CR>",       desc = "Take ours (LOCAL)" },
      { "<leader>ct", ":diffget REMOTE<CR>",      desc = "Take theirs (REMOTE)" },
    },
    config = function()
      local group = vim.api.nvim_create_augroup("Temsan_Fugitive", { clear = true })
      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = group,
        pattern = "*",
        callback = function()
          if vim.bo.ft ~= "fugitive" then return end
          local bufnr = vim.api.nvim_get_current_buf()
          local opts = { buffer = bufnr, remap = false }
          vim.keymap.set("n", "<leader>p", function() vim.cmd.Git("push") end, opts)
          vim.keymap.set("n", "<leader>P", function() vim.cmd.Git({ "pull", "--rebase" }) end, opts)
          vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
        end,
      })
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh", "DiffviewFileHistory" },
  },
}
