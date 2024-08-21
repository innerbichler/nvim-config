vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- color schemes
	use { 'rose-pine/neovim', as = 'rose-pine' }
	use { "ellisonleao/gruvbox.nvim" }
	use 'marko-cerovac/material.nvim'
	use "mofiqul/vscode.nvim"
	-- -- -- -- -- --

	use "nvim-lua/plenary.nvim"
	use 'earthly/earthly.vim'
	use 'tpope/vim-fugitive'
	
	use({
		"stevearc/conform.nvim",
		config = function()
		require("conform").setup()
		end,
	})

	use { 
		'ThePrimeagen/harpoon',
		branch = "harpoon2",
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		    'nvim-telescope/telescope.nvim', tag = '0.1.8',
		    -- or                            , branch = '0.1.x',
		    requires = { {'nvim-lua/plenary.nvim'} }
		}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
			{"neovim/nvim-lspconfig"},

			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use 'voldikss/vim-floaterm'
	use 'nvim-lualine/lualine.nvim'
end)
