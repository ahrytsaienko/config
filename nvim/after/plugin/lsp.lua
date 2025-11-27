local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"]      = cmp.mapping.confirm({ select = true }),

    ["<C-j>"]     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"]     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

    -- If you want tab to jump through snippet placeholders, uncomment this block:
    ["<Tab>"]     = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ["<S-Tab>"]   = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }),
})

-- Capabilities tell LSP servers what editor features you support (like completion)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- =========
-- on_attach: runs when a language server actually attaches to a buffer
-- =========
local on_attach = function(client, bufnr)
  local map = function(mode, keys, func, desc)
    vim.keymap.set(mode, keys, func, { buffer = bufnr, silent = true, desc = desc })
  end

  -- Go to definition, hover docs, references
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "K", vim.lsp.buf.hover, "Hover docs")
  map("n", "gr", vim.lsp.buf.references, "Find references")

  -- Rename symbol, code action
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")

  -- Diagnostics
  map("n", "<leader>vd", vim.diagnostic.open_float, "Line diagnostics")
  map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

  -- Signature help in insert mode
  map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")

  -- Enable inlay hints automatically if server supports them (Neovim >=0.10+)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

-- =========
-- Diagnostic UI tweaks
-- =========
vim.diagnostic.config({
  virtual_text = true,
  float = { border = "rounded" },
  signs = true,
})

-- prettier icons in signcolumn
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- =========
-- Mason + mason-lspconfig + lspconfig
-- =========
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "gopls",
    "rust_analyzer",
    "zls",
    "lua_ls",
    "terraformls",
    "tflint",
  },
  automatic_installation = true,
})


-- Lua (your Neovim config, stop 'vim' undefined warning)
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

-- Go (gopls)
vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      analyses = {
        ST1000 = false, -- disable "at least one file in a package should have a package comment"
      },
    },
  },
})

-- Rust
vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
  on_attach = on_attach,
  -- extra rust-analyzer settings can go here if you want
  -- settings = { ["rust-analyzer"] = { ... } }
})

-- Zig
vim.lsp.config("zls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Terraform
vim.lsp.config("terraformls", {
  capabilities = capabilities,
  on_attach = on_attach,
})
