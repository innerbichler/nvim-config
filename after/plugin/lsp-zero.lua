local lsp_zero = require('lsp-zero')
require('mason').setup({})
require('mason-lspconfig').setup({
	  ensure_installed = {},
	    handlers = {
		        lsp_zero.default_setup,
		},
})


lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)
