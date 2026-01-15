
function ReplaceOverQuickFix()
	local qf = vim.fn.getqflist()
	local text = qf[1].text
	local lines = {"Items: " .. #qf, "", "Match: ","Replace: ","", "","Press q or <Esc> to close." }
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	local ui = vim.api.nvim_list_uis()[1]
	local width, height = 40, #lines
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = math.floor((ui.height - height) / 2),
		col = math.floor((ui.width - width) / 2),
		title=" what are you doing ",
		width = width,
		height = height,
		style = "minimal",
		border = "rounded"
	})
	local function close()
		if vim.api.nvim_win_is_valid(win)
		then vim.api.nvim_win_close(win, true)
		end
	end
	vim.keymap.set("n", "q", close, { buffer = buf })
	vim.keymap.set("n", "<Esc>", close, { buffer = buf })
end

