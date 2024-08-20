function ApplyColor(color)
	color = color or 'retrobox'
	vim.cmd('colorscheme', color)

end

vim.cmd('hi Normal guibg=#0f0f0f ctermbg=black')
vim.cmd('hi LineNr guibg=#0f0f0f ctermbg=black')

