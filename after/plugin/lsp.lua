local lsp = require('lsp-zero')


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
	'gopls',
    };
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
  },
})


local cmp = require('cmp')
local cmp_action = lsp.cmp_action()
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
        ['<leader><Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),

    })
})


lsp.on_attach(function(client, bufnr)
  
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'H', function() vim.lsp.buf.hover() end, opts)

end)

lsp.setup()
