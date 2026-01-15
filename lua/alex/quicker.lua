local main_color = "#ff0044"

local function get_current_dir()
	local src = vim.api.nvim_buf_get_name(source_buf)
	if src == "" then vim.notify("no source file", vim.log.levels.ERROR); return end
	local dir = vim.fn.fnamemodify(src, ':p:h')
	return dir
end


local function _db_path() return vim.fn.expand('%:p:h') .. '/.thoughts.alex.lua' end
local function _load() local p=_db_path(); local ok,t=pcall(dofile,p); return (ok and type(t)=='table') and t or {} end
local function _save(t) 
	local f=assert(io.open(_db_path(),'w'))
	f:write('return ' .. vim.inspect(t))
	f:close()
end

local function save_line(filename, linenumber, text, timestamp)
	local db = _load()
	db[filename] = db[filename] or {}
	local list = db[filename]
	local found = nil
	local count = 0
	for i, e in ipairs(list) do
		vim.notify("HELLO MISTER ROCKY" .. tostring(e.linenumber))
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
	_save(db)
	return found or list[#list]
end

local function save_thoughts_lua(float_buf, filename, linenumber)
  source_buf = vim.fn.bufnr('#')
  local dir = get_current_dir()
  local text = table.concat(vim.api.nvim_buf_get_lines(float_buf, 0, -1, false), "\n")
  local win = (function() for _, w in ipairs(vim.fn.win_findbuf(source_buf)) do return w end end)()
  local timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
  local entry = { filename = filename, timestamp = timestamp, linenumber = linenumber, text = text }
  local tbl ={filename =  e } 
  local path = dir .."/.thoughts.alex.lua"
  save_line(filename, linenumber, text, timestamp)
  --vim.notify("saved " .. path)
end

function ReplaceOverQuickFix()
	
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')
	local linenumber = vim.api.nvim_win_get_cursor(win)[1]

	local qf = vim.fn.getqflist()

	local buf = vim.api.nvim_create_buf(false, true)
	local ui = vim.api.nvim_list_uis()[1]
	local width, height = 40,10

	local title = " Thought " .. os.date("!%H:%M:%S %d-%m-%Y "),
	vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = math.floor((ui.height - height) / 4),
		col = math.floor((ui.width - width)),
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
		if vim.api.nvim_win_is_valid(win)
		then vim.api.nvim_win_close(win, true)
		save_thoughts_lua(buf,filename, linenumber)
		end
	end
	vim.keymap.set("n", "q", close, { buffer = buf })
	vim.keymap.set("n", "<Esc>", close, { buffer = buf })
end

