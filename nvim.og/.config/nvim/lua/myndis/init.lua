local function show_in_floating_window(lines)
	-- Create a new buffer for the floating window
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	-- Set up floating window options (position, size, etc.)
	local width = 50
	local height = #lines
	local opts = {
		style = "minimal",
		relative = "editor",
		width = width,
		height = height,
		row = 1,
		col = vim.o.columns - width - 2, -- top-right corner
		border = "rounded",
	}

	-- Open the floating window and set it as the current window
	local win_id = vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_set_current_win(win_id) -- Focus on the floating window

	-- Map 'Esc' to close the floating window, only in this buffer
	vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":close<CR>", { noremap = true, silent = true })

	-- Optionally: auto-close the window after 3 seconds (or any desired time)
	vim.defer_fn(function()
		if vim.api.nvim_win_is_valid(win_id) then
			vim.api.nvim_win_close(win_id, true)
		end
	end, 3000)
end

local function time_ago(iso_time)
	local pattern = "(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)"
	local year, month, day, hour, min, sec = iso_time:match(pattern)
	local snapshot_time = os.time({
		year = tonumber(year),
		month = tonumber(month),
		day = tonumber(day),
		hour = tonumber(hour),
		min = tonumber(min),
		sec = tonumber(sec),
	})
	local diff = os.difftime(os.time(), snapshot_time)

	if diff < 60 then
		return diff .. " seconds ago"
	elseif diff < 3600 then
		return math.floor(diff / 60) .. " minutes ago"
	elseif diff < 86400 then
		return math.floor(diff / 3600) .. " hours ago"
	else
		return math.floor(diff / 86400) .. " days ago"
	end
end

local username = "FuggiWuggi"
local json = vim.fn.system("curl -s https://api.wiseoldman.net/v2/players/" .. username)
local data = vim.fn.json_decode(json)

if data and data.latestSnapshot and data.latestSnapshot.data then
	local skills = data.latestSnapshot.data.skills
	local attack = skills and skills.attack and skills.attack.level or "N/A"

	local total_level = skills.overall and skills.overall.level or "N/A"

	local total_ehb = data.ehb or "N/A"

	local chambers_of_xeric_ehb = data.latestSnapshot.data.bosses
			and data.latestSnapshot.data.bosses.chambers_of_xeric
			and data.latestSnapshot.data.bosses.chambers_of_xeric.ehb
		or "N/A"

	local snapshot_date = data.latestSnapshot.createdAt or "Unknown"
	local snapshot_relative = snapshot_date ~= "Unknown" and time_ago(snapshot_date) or "Unknown"

	show_in_floating_window({
		username .. "'s stats",
		"Attack level: " .. attack,
		"Total level: " .. total_level,
		"Total EHB: " .. total_ehb,
		"COX EHB: " .. chambers_of_xeric_ehb,
		"Snapshot: " .. snapshot_date .. " (" .. snapshot_relative .. ")",
	})
else
	print("Could not retrieve data or snapshot.")
end
