-------------------------------------HELPER FUNCTIONS FOR LUALINE----------------------------------------
-- -- try git status

-- helper function to loop over string lines
-- copied from https://stackoverflow.com/a/19329565
-- local function iterlines(s)
-- 	if s:sub(-1) ~= "\n" then
-- 		s = s .. "\n"
-- 	end
-- 	return s:gmatch("(.-)\n")
-- end
--
-- -- find directory
-- function find_dir(d)
-- 	-- return if root
-- 	if d == "/" then
-- 		return d
-- 	end
-- 	-- initialize git_state variable
-- 	if vim.b.git_state == nil then
-- 		vim.b.git_state = { "", "", "", "" }
-- 	end
-- 	-- fix terminal
-- 	if d:find("term://") ~= nil then
-- 		return "/tmp"
-- 	end
-- 	-- fix fzf
-- 	if d:find("/tmp/.*FZF") ~= nil then
-- 		return "/tmp"
-- 	end
-- 	-- fix fugitive etc.
-- 	if d:find("^%w+://") ~= nil then
-- 		vim.b.git_state[1] = " " .. d:gsub("^(%w+)://.*", "%1") .. " "
-- 		d = d:gsub("^%w+://", "")
-- 	end
-- 	-- check renaming
-- 	local ok, err, code = os.rename(d, d)
-- 	if not ok then
-- 		if code ~= 2 then
-- 			-- all other than not existing
-- 			return d
-- 		end
-- 		-- not existing
-- 		local newd = d:gsub("(.*/)[%w._-]+/?$", "%1")
-- 		return find_dir(newd)
-- 	end
-- 	-- d ok
-- 	return d
-- end
--
-- -- get git status
-- local function git_status()
-- 	vim.b.git_state = { "", "", "" }
-- 	-- get & check file directory
-- 	file_dir = find_dir(vim.fn.expand("%:p:h"))
-- 	-- check fugitive etc.
-- 	if vim.b.git_state[1] ~= "" then
-- 		return "u"
-- 	end
-- 	-- capture git status call
-- 	local cmd = "git -C " .. file_dir .. " status --porcelain -b 2> /dev/null"
-- 	local handle = assert(io.popen(cmd, "r"), "")
-- 	-- output contains empty line at end (removed by iterlines)
-- 	local output = assert(handle:read("*a"))
-- 	-- close io
-- 	handle:close()
--
-- 	local git_state = { "", "", "", "" }
-- 	-- branch coloring: 'o': up to date with origin; 'd': head detached; 'm': not up to date with origin
-- 	local branch_col = "o"
--
-- 	-- check if git repo
-- 	if output == "" then
-- 		-- not a git repo
-- 		-- save to variable
-- 		vim.b.git_state = git_state
-- 		-- exit
-- 		return branch_col
-- 	end
--
-- 	-- get line iterator
-- 	local line_iter = iterlines(output)
--
-- 	-- process first line (HEAD)
-- 	local line = line_iter()
-- 	if line:find("%(no branch%)") ~= nil then
-- 		-- detached head
-- 		branch_col = "d"
-- 	else
-- 		-- on branch
-- 		local ahead = line:gsub(".*ahead (%d+).*", "%1")
-- 		local behind = line:gsub(".*behind (%d+).*", "%1")
-- 		-- convert non-numeric to nil
-- 		ahead = tonumber(ahead)
-- 		behind = tonumber(behind)
-- 		if behind ~= nil then
-- 			git_state[1] = "↓ " .. tostring(behind) .. " "
-- 		end
-- 		if ahead ~= nil then
-- 			git_state[1] = git_state[1] .. "↑ " .. tostring(ahead) .. " "
-- 		end
-- 	end
--
-- 	-- loop over residual lines (files) &
-- 	-- store number of files
-- 	local git_num = { 0, 0, 0 }
-- 	for line in line_iter do
-- 		branch_col = "m"
-- 		-- get first char
-- 		local first = line:gsub("^(.).*", "%1")
-- 		if first == "?" then
-- 			-- untracked
-- 			git_num[3] = git_num[3] + 1
-- 		elseif first ~= " " then
-- 			-- staged
-- 			git_num[1] = git_num[1] + 1
-- 		end
-- 		-- get second char
-- 		local second = line:gsub("^.(.).*", "%1")
-- 		if second == "M" then
-- 			-- modified
-- 			git_num[2] = git_num[2] + 1
-- 		end
-- 	end
--
-- 	-- build output string
-- 	if git_num[1] ~= 0 then
-- 		git_state[2] = "● " .. git_num[1]
-- 	end
-- 	if git_num[2] ~= 0 then
-- 		git_state[3] = "+ " .. git_num[2]
-- 	end
-- 	if git_num[3] ~= 0 then
-- 		git_state[4] = "… " .. git_num[3]
-- 	end
--
-- 	-- save to variable
-- 	vim.b.git_state = git_state
--
-- 	return branch_col
-- end

local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local function current_buffer_number()
	return "b:" .. vim.api.nvim_get_current_buf()
end

local function session_name()
	return require("possession.session").session_name or ""
end

local colors = {
	-- red = '#ca1243',
	grey = "#F3F4ED",
	-- light_grey = '#bebebe',
	-- black = '#383a42',
	-- white = '#f3f3f3',
	-- light_green = '#83a598',
	-- orange = '#fe8019',
	-- green = '#8ec07c',
	-- synth_dark = '#4a495f',
	-- synth_light = '#5c2c6d',
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"diff",
			{ "diagnostics", sources = { "nvim_lsp" } },
			fg = colors.white,
			bg = colors.white,
		},
		-- lualine_c = {
		-- 	{
		-- 		"branch",
		-- 		color = function(section)
		-- 			local gs = git_status()
		-- 			if gs == "d" then
		-- 				return { fg = "#916BDD" }
		-- 			elseif gs ~= "m" then
		-- 				return { fg = "#769945" }
		-- 			end
		-- 		end,
		-- 	},
		-- 	{
		-- 		-- head status
		-- 		"vim.b.git_state[1]",
		-- 		color = function(section)
		-- 			if vim.b.git_state[1]:find("^ %w+ $") ~= nil then
		-- 				return { fg = "#F49B55" }
		-- 			end
		-- 		end,
		-- 		padding = { left = 0, right = 0 },
		-- 	},
		-- 	{
		-- 		-- staged files
		-- 		"vim.b.git_state[2]",
		-- 		color = { fg = "#769945" },
		-- 		padding = { left = 0, right = 1 },
		-- 	},
		-- 	{
		-- 		-- modified files
		-- 		"vim.b.git_state[3]",
		-- 		color = { fg = "#D75F00" },
		-- 		padding = { left = 0, right = 1 },
		-- 	},
		-- 	{
		-- 		-- untracked files
		-- 		"vim.b.git_state[4]",
		-- 		color = { fg = "#D99809" },
		-- 		padding = { left = 0, right = 1 },
		-- 	},
		-- },
		-- lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_x = {
			-- session_name,
			-- { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
			--     hint = ' ' } },
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		-- lualine_c = { 'filename' },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = { "buffers" },
		lualine_c = {
			{
				"filename",
				path = 1, -- 0 = filename, 1 = relative path, 2 = absolute path
				shorting_target = 100, -- Optional: shortens long paths
			},
		},
		lualine_x = {},
		lualine_y = {},
		-- lualine_z = { 'tabs' }
	},
	extensions = {},
})

-- from net

--
-- local theme = {
--     normal = {
--         a = { fg = colors.white, bg = colors.synth_dark },
--         b = { fg = colors.white, bg = colors.synth_dark },
--         c = { fg = colors.black, bg = colors.black },
--         z = { fg = colors.white, bg = colors.black },
--     },
--     insert = { a = { fg = colors.black, bg = colors.light_green } },
--     visual = { a = { fg = colors.black, bg = colors.orange } },
--     replace = { a = { fg = colors.black, bg = colors.green } },
-- }
--
-- local empty = require('lualine.component'):extend()
-- function empty:draw(default_highlight)
--     self.status = ''
--     self.applied_separator = ''
--     self:apply_highlights(default_highlight)
--     self:apply_section_separators()
--     return self.status
-- end
--
-- -- Put proper separators and gaps between components in sections
-- local function process_sections(sections)
--     for name, section in pairs(sections) do
--         local left = name:sub(9, 10) < 'x'
--         for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
--             table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.light_grey } })
--         end
--         for id, comp in ipairs(section) do
--             if type(comp) ~= 'table' then
--                 comp = { comp }
--                 section[id] = comp
--             end
--             comp.separator = left and { right = '' } or { left = '' }
--         end
--     end
--     return sections
-- end
--
-- local function search_result()
--     if vim.v.hlsearch == 0 then
--         return ''
--     end
--     local last_search = vim.fn.getreg('/')
--     if not last_search or last_search == '' then
--         return ''
--     end
--     local searchcount = vim.fn.searchcount { maxcount = 9999 }
--     return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
-- end
--
-- local function modified()
--     if vim.bo.modified then
--         return '+'
--     elseif vim.bo.modifiable == false or vim.bo.readonly == true then
--         return '-'
--     end
--     return ''
-- end
--
-- require('lualine').setup {
--     options = {
--         theme = theme,
--         component_separators = '',
--         section_separators = { left = '', right = '' },
--     },
--     sections = process_sections {
--         lualine_a = { 'mode' },
--         lualine_b = {
--             'branch',
--             'diff',
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'error' },
--                 diagnostics_color = { error = { bg = colors.synth_light, fg = colors.white } },
--             },
--             {
--                 'diagnostics',
--                 source = { 'nvim' },
--                 sections = { 'warn' },
--                 diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
--             },
--             -- { 'filename', file_status = false },
--             { modified, color = { bg = colors.synth_light } },
--             {
--                 '%w',
--                 cond = function()
--                     return vim.wo.previewwindow
--                 end,
--             },
--             {
--                 '%r',
--                 cond = function()
--                     return vim.bo.readonly
--                 end,
--             },
--             {
--                 '%q',
--                 cond = function()
--                     return vim.bo.buftype == 'quickfix'
--                 end,
--             },
--         },
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = { search_result, 'filetype' },
--         lualine_z = { '%l:%c', '%p%%/%L' },
--     },
--     inactive_sections = {
--         lualine_c = { '%f %y %m' },
--         lualine_x = {},
--     },
--     tabline = {
--         lualine_a = { 'buffers' },
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { 'tabs' }
--     },
-- }
