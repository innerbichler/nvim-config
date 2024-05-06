local Time = os.time()
local Speed = 0
local High = 0
local function game()
	Speed = Speed + 1
	local text = "Speed: " .. Speed .." --- Score: " .. High
	if os.time() > Time + 10 then
		Time = os.time()
		if Speed > High then
			High = Speed
			print("----->  Congrats new HighScore  <-----")
		end
		Speed = 0
	end
	return text
end
local Start = os.time()
local Line = Get_random_headline()
local function news()
	if os.time() > Start + 30 then
		Start = os.time()
		Line = Get_random_headline()
	end
	return Line
end

require('lualine').setup {
	options = {
		icons_enabled = false,  -- Disable icons
		theme = 'auto',
		component_separators = { left = '', right = '' },  -- Remove component separators
		section_separators = { left = '', right = '' },  -- Remove section separators

	},
	refresh = {
		status_line = 500,
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {"windows"},
		lualine_c = {},
		lualine_x = {news},
		lualine_y = {"branch"},
		lualine_z = {"diff"}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	}
}
