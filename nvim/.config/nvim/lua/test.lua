function test()
    lua vim.api.nvim_echo({{'first chunk and ', 'None'}, {'second chunk to echo', 'None'}}, false, {})
end
test()
