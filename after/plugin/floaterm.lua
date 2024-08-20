vim.keymap.set('n', '<leader>t', ":FloatermToggle<CR>", {})
vim.keymap.set('n', '<leader>k', ":FloatermNext<CR>", {})
vim.keymap.set('n', '<leader>z', ":FloatermNew --height=0.9 --width=0.9 --wintype=floating<CR>", {})
--vim.cmd("hi Floaterm guibg=transparent")
vim.cmd("hi FloatermBorder guibg=transparent guifg=#CC5500")

vim.g.floaterm_titleposition = 'center'
vim.g.floaterm_title = ' terminal $1 of $2 '
vim.g.floaterm_winblend = 0.5
--vim.g.floaterm_borderchars = '12345678'
vim.g.floaterm_borderchars = '─│─│╭╮╯╰'



