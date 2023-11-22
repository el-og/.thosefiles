-- vim.opt.nocompatible = true -- usually good idea to turn it on just in case
-- Rooter
vim.g['rooter_cd_cmd'] = 'lcd'

vim.opt.path:append('**')

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list,full'

vim.opt.exrc = true
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.opt.hidden = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.incsearch = true


vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 40

vim.opt.encoding = 'utf-8'

vim.opt.confirm = true

-- vim.opt.shortmess:append('c') -- messages about swap files

vim.opt.laststatus = 2
-- vim.opt.statusline = '\ %F'

vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.opt.guicursor:append('a:-Cursor-blinkwait175-blinkoff150-blinkon175')
vim.opt.splitright = true
vim.opt.cursorline = true


local match_filetype = function(filename)
	-- attempt with buffer content and filename
	local filetype = vim.filetype.match({ buf = 0, filename = filename })

	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local remove_indices = {}
	for index, line in ipairs(lines) do
		if string.match(line, {{ "\"{{\"" }}) then
			-- insert index at first positon in list
			table.insert(remove_indices, 1, index)
		end
	end
	for _, index in ipairs(remove_indices) do
		-- remove tmpl lines
		table.remove(lines, index)
	end

	if not filetype then
		-- attempt without tmpl lines
		filetype = vim.filetype.match({ filename = filename, contents = lines })
	end

	if not filetype then
		-- attempt without filename
		filetype = vim.filetype.match({ contents = lines })
	end

	if not filetype then
		--attempt just from name
		filetype = vim.filetype.match({ filename = filename })
	end
	return filetype
end

local detect_tmpl_filetype = function()
	local full_filename = vim.fn.expand("%:t")
	if string.sub(full_filename, -5, -1) == ".hbs" then
		local filename_without_tmpl = vim.fn.fnamemodify(full_filename, ":t:r")
		-- replace 'dot_' with '.'
		local filename = filename_without_tmpl:gsub("dot_", ".")

		vim.bo.filetype = match_filetype(filename) or ""
	end
end

-- vim.api.nvim_create_autocmd({
--     "BufWinEnter"
-- }, {
-- 	pattern = "*.tmpl",
-- 	callback = detect_tmpl_filetype,
-- })

vim.cmd("autocmd VimEnter * :GitBlameDisable")
