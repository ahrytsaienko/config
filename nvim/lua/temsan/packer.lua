-- ============================================================================
-- 📦 Plugin Management with packer.nvim
-- ============================================================================
-- This file is loaded from your init.lua via:
--   lua require('plugins')
--
-- To (re)install all plugins:
--   :source % | PackerSync
-- ============================================================================

vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- --------------------------------------------------------------------------
  -- 🧰 Core
  -- --------------------------------------------------------------------------
  use 'wbthomason/packer.nvim' -- Let packer manage itself

  -- --------------------------------------------------------------------------
  -- 💅 UI / Appearance
  -- --------------------------------------------------------------------------
  use({
    'projekt0n/github-nvim-theme', -- GitHub-style light/dark theme
    config = function()
      vim.cmd('colorscheme github_light_default')
    end
  })

  use({
    'nvim-lualine/lualine.nvim', -- Modern statusline
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto',
          globalstatus = true, -- One statusline for entire screen
        },
      })
    end,
  })

  use({
    "folke/trouble.nvim", -- Pretty diagnostics / quickfix list
    config = function()
      require("trouble").setup({
        icons = true,
        use_diagnostic_signs = true,
      })
    end
  })

  use({
    "lewis6991/gitsigns.nvim", -- Git diff signs + blame in gutter
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
      })
    end
  })

  -- --------------------------------------------------------------------------
  -- 🪵 Navigation & File Management
  -- --------------------------------------------------------------------------
  use({
    'nvim-tree/nvim-tree.lua', -- File explorer sidebar
    requires = { 'nvim-tree/nvim-web-devicons' },
  })

  use({
    'nvim-telescope/telescope.nvim', -- Fuzzy finder (files, LSP, etc.)
    tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  use("christoomey/vim-tmux-navigator") -- Seamless tmux <-> nvim navigation

  -- --------------------------------------------------------------------------
  -- 🧠 Syntax & Text Editing
  -- --------------------------------------------------------------------------
  use({
    'nvim-treesitter/nvim-treesitter', -- Better syntax highlighting
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  })
  use("nvim-treesitter/nvim-treesitter-context") -- Sticky context at top of file

  use({
    "numToStr/Comment.nvim", -- Toggle comments easily
    config = function()
      require("Comment").setup()
    end
  })

  use({
    "kylechui/nvim-surround", -- Edit surroundings (quotes, brackets)
    tag = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  })

  use({
    "windwp/nvim-autopairs", -- Auto-close brackets, quotes, etc.
    config = function()
      require("nvim-autopairs").setup({})
    end
  })

  use("tpope/vim-fugitive") -- Git wrapper inside Neovim
  use("sindrets/diffview.nvim") -- Git diff view

  -- --------------------------------------------------------------------------
  -- 🧩 LSP / Completion / Snippets
  -- --------------------------------------------------------------------------
  -- 🛠 LSP server manager
  use({
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  })

  -- 🔌 Mason bridge to nvim-lspconfig
  use("williamboman/mason-lspconfig.nvim")

  -- ⚙️ Core LSP configurations
  use("neovim/nvim-lspconfig")

  -- 🧠 Autocompletion engine
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-buffer")

  -- ✂️ Snippet support
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- --------------------------------------------------------------------------
  -- ✅ End of plugin list
  -- --------------------------------------------------------------------------
end)
