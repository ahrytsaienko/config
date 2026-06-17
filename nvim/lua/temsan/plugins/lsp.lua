return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "gopls",
        "rust_analyzer",
        "zls",
        "lua_ls",
        "terraformls",
        "basedpyright",
        "ruff",
        "vtsls",
        "eslint",
      },
      automatic_enable = false,
    },
  },

  -- Auto-install non-LSP tools (formatters for conform.nvim, linters for nvim-lint)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- formatters (conform.nvim)
        "stylua",
        "gofumpt",
        "goimports",
        "prettier",
        "shfmt",
        -- linters (nvim-lint)
        "golangci-lint",
        "shellcheck",
        "tflint",
        "hadolint",
      },
      run_on_start = true,
      start_delay = 3000, -- wait 3s after startup before checking
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = bufnr, silent = true, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "K", vim.lsp.buf.hover, "Hover docs")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>vd", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
        map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")
      end

      vim.diagnostic.config({
        virtual_text = true,
        underline = false,
        float = { border = "rounded" },
        signs = true,
      })

      local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.lsp.config("*", {
        flags = { allow_incremental_sync = false },
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            staticcheck = true,
            gofumpt = true,
            analyses = { ST1000 = false },
          },
        },
      })

      vim.lsp.config("rust_analyzer", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("zls", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("terraformls", { capabilities = capabilities, on_attach = on_attach })

      vim.lsp.config("basedpyright", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      })

      vim.lsp.config("ruff", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Let basedpyright own hover/navigation; ruff handles lint + format only.
          client.server_capabilities.hoverProvider = false
          client.server_capabilities.definitionProvider = false
          client.server_capabilities.declarationProvider = false
          client.server_capabilities.typeDefinitionProvider = false
          client.server_capabilities.implementationProvider = false
          client.server_capabilities.referencesProvider = false
          client.server_capabilities.documentSymbolProvider = false
          on_attach(client, bufnr)
        end,
      })

      vim.lsp.config("vtsls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "literals" },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
            },
          },
          javascript = {
            inlayHints = {
              parameterNames = { enabled = "literals" },
              variableTypes = { enabled = true },
            },
          },
        },
      })

      vim.lsp.config("eslint", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- fix-on-save: eslint LSP registers LspEslintFixAll on attach
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "LspEslintFixAll",
          })
        end,
      })

      vim.lsp.enable({ "lua_ls", "gopls", "rust_analyzer", "zls", "terraformls", "basedpyright", "ruff", "vtsls", "eslint" })
    end,
  },
}
