local main_color = "#ff0044"


local namespace = vim.api.nvim_create_namespace("QuickerSymbols")

local function set_status_symbol(bufnr, line, symbol, hl_group)
  vim.api.nvim_buf_set_extmark(bufnr, namespace, line, 0, {
    virt_text = { { symbol, hl_group } },
    virt_text_pos = "overlay",            
    right_gravity = true,
  })
end

--local function _db_path() return vim.fn.expand('%:p:h') .. '/.thoughts.alex.lua' end

local function _db_path(filedir)
  return filedir .. "/.thoughts.alex.lua"
end

local function _load(filedir)
	local p=_db_path(filedir)
	local ok,t=pcall(dofile,p)
	return (ok and type(t)=='table') and t or {}
end
local function _save(t, filedir) 
	local f=assert(io.open(_db_path(filedir),'w'))
	f:write('return ' .. vim.inspect(t))
	f:close()
end

local function save_line(filedir, filename, linenumber, text, timestamp)
	local db = _load(filedir)
	db[filename] = db[filename] or {}
	local list = db[filename]
	local found = nil
	local count = 0
	for i, e in ipairs(list) do
		if e.linenumber == linenumber then
			found = e 
			break
		end
		count = count +1
	end
	if found then
		found.text = text
	else
	table.insert(list, { linenumber = linenumber, text = text, timestamp = timestamp})
	end
	_save(db, filedir)
	vim.notify("saved tought")
	return found or list[#list]
end

local function fetch_line(filedir, filename, linenumber)
	local db = _load(filedir)
	db[filename] = db[filename] or {}
	local list = db[filename]
	local found = nil
	for _, e in ipairs(list) do
		if e.linenumber == linenumber then
			found = e 
			break
		end
	end
	if found then
		return found
	end
	local timestamp = os.date("!%H:%M:%S %d-%m-%Y ")
	return {linenumber = linenumber, text = nil, timestamp = timestamp }
end

function QuickerDeleteAllMarks()
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_clear_namespace(buf, namespace, 0, -1)
end
function QuickerSetAllMarks()
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')


	local db = _load()
	db[filename] = db[filename] or {}
	local list = db[filename]
	for _, e in ipairs(list) do
		set_status_symbol(buf, e.linenumber, "€", "ErrorMsg")
	end
end

local function save_thoughts_lua(float_buf, filedir, filename, linenumber)

	local text = table.concat(vim.api.nvim_buf_get_lines(float_buf, 0, -1, false), "\n")
	if text == "" then
		return
	end
	local timestamp = os.date("!%H:%M:%S %d-%m-%Y ")
	local buf = vim.fn.bufnr('#')
	set_status_symbol(buf, linenumber-1, "€", "ErrorMsg")
	save_line(filedir, filename, linenumber, text, timestamp)
end

function QuickerNewThought()
	
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')
	local filedir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':p:h')
	local linenumber = vim.api.nvim_win_get_cursor(win)[1]

	local line = fetch_line(filedir, filename, linenumber)

	local buf = vim.api.nvim_create_buf(false, true)

	-- need to split the lines up again
	if line.text then
		local lines = vim.split(line.text, "\n", { plain = true })
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	end
--	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {""})

	local ui = vim.api.nvim_list_uis()[1]
	local width, height = 40,10

	local title = " " .. tostring(linenumber) .." THOUGHT " .. line.timestamp
	vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = math.floor((ui.height - height) / 4),
		col = math.floor((ui.width - width -5)),
		title=title,
		width = width,
		height = height,
		style = "minimal",
		border = "rounded"
	})
	
	vim.api.nvim_win_set_option(win, "winhl", "Normal:QuickerFloat,FloatBorder:QuickerBorder,FloatTitle:QuickerFloatTitle")
	vim.api.nvim_set_hl(0, "QuickerFloat", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "QuickerBorder", { bg = "NONE", fg = main_color })
	vim.api.nvim_set_hl(0, "QuickerFloatTitle", { fg = main_color, bg = "NONE", bold = true })


	local function close()
		save_thoughts_lua(buf, filedir, filename, linenumber)
		if vim.api.nvim_win_is_valid(win)
		then vim.api.nvim_win_close(win, true)
		end
	end
	vim.keymap.set("n", "q", close, { buffer = buf })
	vim.keymap.set("n", "<Esc>", close, { buffer = buf })
end


