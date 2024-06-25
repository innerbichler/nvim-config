function ApplyColor(color)
	color = color or 'retrobox'
	vim.cmd('colorscheme', color)

end

vim.cmd('hi Normal guibg=black ctermbg=black')
vim.cmd('hi LineNr guibg=black ctermbg=black')

