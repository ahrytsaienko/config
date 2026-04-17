return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
        mode = { "n", "v" },
        desc = "Format buffer (conform → LSP fallback)",
      },
    },
    opts = {
      formatters_by_ft = {
        lua        = { "stylua" },
        go         = { "goimports", "gofumpt" },
        rust       = { "rustfmt" },
        zig        = { "zigfmt" },
        terraform  = { "terraform_fmt" },
        tf         = { "terraform_fmt" },
        json       = { "prettier" },
        yaml       = { "prettier" },
        markdown   = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        sh         = { "shfmt" },
      },
      default_format_opts = { lsp_format = "fallback" },
      format_on_save = nil, -- keep manual; wire to autocmd if/when desired
    },
  },
}
