vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use("mofiqul/vscode.nvim")
	use 'datsfilipe/vesper.nvim'

	use("tpope/vim-fugitive")
	use("vague2k/vague.nvim")

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use("nvim-tree/nvim-web-devicons")
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use("nvim-neotest/neotest-python")
	use("fredrikaverpil/neotest-golang")

	use({ "chomosuke/term-edit.nvim", tag = "v1.*" })

	use("voldikss/vim-floaterm")
	use("nvim-lualine/lualine.nvim")
	use("stevearc/dressing.nvim")
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")
	use("MeanderingProgrammer/render-markdown.nvim")

	-- use("zbirenbaum/copilot.lua")
	--
	-- use({
	-- 	"yetone/avante.nvim",
	-- 	branch = "main",
	-- 	run = "make",
	-- 	config = function() end,
	-- })

	use("HakonHarnes/img-clip.nvim")
	use("stevearc/dressing.nvim") -- for enhanced input UI
	use("folke/snacks.nvim") -- for modern input UI

	-- Avante.nvim with build process
	use({
		"yetone/avante.nvim",
		branch = "main",
		run = "make",
		config = function()
			require("avante").setup()
		end,
	})
end)
