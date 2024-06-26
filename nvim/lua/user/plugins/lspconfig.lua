-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Typescript
require('lspconfig').tsserver.setup({capabilities = capabilities})

-- PHP
require('lspconfig').intelephense.setup({capabilities = capabilities})

-- Clojure
require('lspconfig').clojure_lsp.setup({capabilities = capabilities})

-- Haskell
require('lspconfig').hls.setup({capabilities = capabilities})

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- ESLINT
require'lspconfig'.eslint.setup({})

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<M-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<Leader>ai', '<cmd>lua vim.lsp.buf.code_action({ diagnostics = vim.diagnostic.get(), only = { \'source.organizeImports\' } })<CR>')

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
