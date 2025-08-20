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
		lualine_x = {
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_x = { "location" },
	},
	tabline = {
		lualine_a = {
			function()
				return vim.fn.expand("%:.") -- Relative path
			end,
		},
	},
	extensions = {},
})
