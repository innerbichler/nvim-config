vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use { 'rose-pine/neovim', as = 'rose-pine' }
	use 'marko-cerovac/material.nvim'
	use { "ellisonleao/gruvbox.nvim" }
	use "nvim-lua/plenary.nvim"
	use "mofiqul/vscode.nvim"
	use 'chriskempson/base16-vim'
	use 'earthly/earthly.vim'
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
