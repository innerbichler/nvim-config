vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>pf', ':Ex<CR>', {})

local function JavaGoogleFormat()
	local current_file = vim.fn.expand('%:p')
	vim.cmd('!java -jar ~/.config/nvim/google-java-format-1.22.0-all-deps.jar -i ' .. current_file)
end
vim.api.nvim_create_user_command('JavaGoogleFormat', JavaGoogleFormat, {})
vim.api.nvim_set_keymap('n', '<leader>jf', ':JavaGoogleFormat<CR>', { noremap = true, silent = true })

-- quickfix list remaps
vim.api.nvim_set_keymap('n', '<leader>cn', ':cn<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>cN', ':cN<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>co', ':copen<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>cc', ':cclose<CR>', {})
