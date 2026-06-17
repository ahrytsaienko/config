return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      completions = { lsp = { enabled = true } },
      code = { width = "block", right_pad = 2 },
      heading = { width = "full" },
    },
  },
}
