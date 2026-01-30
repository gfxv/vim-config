local nvim_lsp = require 'lspconfig'
local configs = require 'lspconfig.configs'
local util = require 'lspconfig.util'

-- Inject Brief LSP
if not configs.briefls then
  configs.briefls = {
    default_config = {
      cmd = { 'briefls' },
      filetypes = { 'brief' },
      root_dir = function(fname)
        return util.root_pattern '.git'(fname)
      end,
      single_file_support = true,
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
    },
    settings = {},
  }
end

-- Setup server
nvim_lsp.briefls.setup {
  on_attach = lsp_attach,
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
}
