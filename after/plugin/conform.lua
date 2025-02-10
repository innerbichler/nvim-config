require("conform").setup({
	formatters_by_ft = {

		lua = { "stylua" },
		python = { "black" },
		go = { "gofumpt" },
		json = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		yaml = { "yaml" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
