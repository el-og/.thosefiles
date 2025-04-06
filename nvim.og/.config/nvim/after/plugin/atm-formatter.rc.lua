-- Highlight groups for font styles
vim.cmd([[
  hi BoldText gui=bold cterm=bold
]])

-- Namespace for highlights (to uniquely identify them)
local ns_id = vim.api.nvim_create_namespace("FontToggleNamespace")

-- Excluded characters or patterns (can be customized)
local excluded_chars = "[%./]"  -- This excludes periods (.) and slashes (/)

-- Function to apply or remove font weight and color to the first 2 characters of the word
_G.toggle_font_word = function(start_line, start_col, apply)
  local bufnr = vim.api.nvim_get_current_buf()
  local end_col = start_col + 2  -- Only the first 2 characters

  if apply then
    -- Apply the highlight
    vim.api.nvim_buf_add_highlight(bufnr, ns_id, "BoldText", start_line, start_col, end_col)
  else
    -- Clear the highlight in the given range by clearing all highlights on this line in this namespace
    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, start_line, start_line + 1)
  end
end

-- Function to recursively toggle styling over the first 2 characters of each word in the buffer
_G.toggle_font_recursive = function()
  local bufnr = vim.api.nvim_get_current_buf()  -- Get the current buffer
  local total_lines = vim.api.nvim_buf_line_count(bufnr)  -- Get the total number of lines

  -- Clear all highlights in the namespace first (to ensure toggle behavior)
  vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

  -- Start cycling through words in the buffer
  local current_pos = {1, 0}  -- Start at line 1, column 0
  while current_pos do
    -- Search for the next word boundary using Vim's 'e' motion (end of word)
    local next_pos = vim.fn.searchpos('\\w\\+', 'n', total_lines)

    -- Break the loop if no more words are found
    if next_pos[1] == 0 then
      break
    end

    local line_num = next_pos[1] - 1  -- Convert to 0-based index
    local col_start = next_pos[2] - 1

    -- Skip excluded characters (check the first character of the word)
    local word = vim.fn.expand('<cword>')
    if not string.find(word, excluded_chars) and #word >= 2 then
      -- Apply highlight to the first 2 characters of the word
      toggle_font_word(line_num, col_start, true)
    end

    -- Move to the next word
    vim.cmd("normal! w")
  end

  -- Reset the cursor to the first line of the document
  vim.cmd("normal! gg")
  vim.cmd("normal! 0")
end

-- Key mapping to toggle the font styling recursively over the entire buffer
vim.api.nvim_set_keymap('n', '<Leader>t', ':lua toggle_font_recursive()<CR>', { noremap = true, silent = true })

-- Command to toggle font styling
vim.cmd([[
  command! ToggleFontRecursive lua toggle_font_recursive()
]])

