vim.keymap.set('n', '<leader>t', ":FloatermToggle<CR>", {})
vim.keymap.set('n', '<leader>k', ":FloatermNext<CR>", {})
vim.keymap.set('n', '<leader>z', ":FloatermNew --height=0.9 --width=0.9 --wintype=floating<CR>", {})
--vim.cmd("hi Floaterm guibg=black")
vim.cmd("hi FloatermBorder guibg=black guifg=white")

vim.g.floaterm_titleposition = 'center'
vim.g.floaterm_title = ' bash $1/$2 '
vim.g.floaterm_winblend = 0.5


