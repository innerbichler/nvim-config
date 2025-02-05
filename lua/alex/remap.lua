vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<leader>pf", ":Texplore<CR>", {})

local function JavaGoogleFormat()
	local current_file = vim.fn.expand("%:p")
	vim.cmd("!java -jar ~/.config/nvim/google-java-format-1.22.0-all-deps.jar -i " .. current_file)
end
vim.api.nvim_create_user_command("JavaGoogleFormat", JavaGoogleFormat, {})
vim.api.nvim_set_keymap("n", "<leader>jf", ":JavaGoogleFormat<CR>", { noremap = true, silent = true })

-- quickfix list remaps start with c
vim.api.nvim_set_keymap("n", "<leader>cn", ":cn<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cN", ":cN<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>co", ":copen<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cc", ":cclose<CR>", {})

-- fugitive vim Git commands start with g
vim.api.nvim_set_keymap("n", "<leader>g", ":Git<CR>:resize<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", ":Git status<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit -a<CR>:resize<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gd", ":Git diff<CR>:resize<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gl", ":Git log<CR>:resize<CR>", {})

-- resize
vim.api.nvim_set_keymap("n", "<leader>rr", ":resize<CR>", {})

-- connect to masa guest pc
vim.api.nvim_set_keymap("n", "<leader>sm", ":Nread scp://guest@100.68.195.24/<CR>", {})

-- tab control starts with nothing
vim.api.nvim_set_keymap("n", "<leader>q", ":tabp<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>e", ":tabn<CR>", {})

-- open underlying file in new tab
vim.api.nvim_set_keymap("n", "<leader>a", ":<C-w>gf<CR>", {})
