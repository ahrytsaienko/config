return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").install({
        "vimdoc", "javascript", "typescript", "c",
        "lua", "rust", "go", "python", "terraform", "json",
      })

      -- Start treesitter only for filetypes with an installed parser.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = args.match
          if ft == "" then return end
          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then return end
          if not pcall(vim.treesitter.language.add, lang) then return end
          pcall(vim.treesitter.start, args.buf, lang)
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
