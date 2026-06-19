return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").install({
        "vimdoc", "javascript", "typescript", "tsx", "css", "c",
        "lua", "rust", "go", "python", "terraform", "json",
        "markdown", "markdown_inline",
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

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
      })

      local select = require("nvim-treesitter-textobjects.select").select_textobject
      local objects = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      }
      for lhs, query in pairs(objects) do
        vim.keymap.set({ "x", "o" }, lhs, function()
          select(query, "textobjects")
        end, { desc = "Textobject " .. query })
      end

      local move = require("nvim-treesitter-textobjects.move")
      -- ]m/[m = function, ]]/[[ = class. Avoids gitsigns' ]c/[c hunk nav.
      local moves = {
        { keys = { "]m", "[m" }, query = "@function.outer", label = "function" },
        { keys = { "]]", "[[" }, query = "@class.outer", label = "class" },
      }
      for _, m in ipairs(moves) do
        vim.keymap.set({ "n", "x", "o" }, m.keys[1], function()
          move.goto_next_start(m.query, "textobjects")
        end, { desc = "Next " .. m.label })
        vim.keymap.set({ "n", "x", "o" }, m.keys[2], function()
          move.goto_previous_start(m.query, "textobjects")
        end, { desc = "Prev " .. m.label })
      end
    end,
  },
}
