return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        go          = { "golangcilint" },
        sh          = { "shellcheck" },
        bash        = { "shellcheck" },
        terraform   = { "tflint" },
        tf          = { "tflint" },
        dockerfile  = { "hadolint" },
      }

      local group = vim.api.nvim_create_augroup("Temsan_Lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = group,
        callback = function() lint.try_lint() end,
      })
    end,
  },
}
