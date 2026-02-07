require("conform").setup({
	formatters_by_ft = {

		lua = { "stylua" },
		python = { "ruff" },
		go = { "gofumpt" },
		json = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		vue = { "prettier" },
		yaml = { "yaml" },
		rust = { "rustfmt" },
		csharp = {"csharpier"}
	},
	format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
