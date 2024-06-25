require("alex")
vim.cmd [[colorscheme retrobox]]
vim.cmd [[tnoremap <Esc> <C-\><C-n>]]
vim.opt.termguicolors = true

-- Define the URL of the RSS feed
local rss_url = "https://feeds.bbci.co.uk/news/world/europe/rss.xml"

-- Define a function to fetch the RSS feed
local function fetch_rss_feed()
    -- Execute curl command to fetch the RSS feed
    local command = "curl -s " .. rss_url  -- Use -s flag to suppress curl progress output
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()

    -- Return the fetched RSS feed content
    return result
end

local function extract_headlines(xml_data)
	local headlines = {}
	for headline in xml_data:gmatch("<title><!%[CDATA%[(.-)%]%]></title>") do
		table.insert(headlines, headline)
	end
	return headlines
end

local Lasttime = os.time()
local Headlines = nil

function Get_random_headline()
	if os.time() >= Lasttime + 3600 or Headlines == nil then
		local rss_feed = fetch_rss_feed()
		Headlines = extract_headlines(rss_feed)
		print("Got new News")
	end
	local count = #Headlines
	if count > 0 then
		local index = math.random(1, count)
		return Headlines[index]
	else
		return "No headlines available"
	end
end
