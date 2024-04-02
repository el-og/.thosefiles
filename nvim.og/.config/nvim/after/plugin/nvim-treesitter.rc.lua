local status, treesitter = pcall(require, "nvim-treesitter")
if (not status) then return end

treesitter.setup({
  context_commentstring = {
    config = {
       javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '{/* %s */}',
          jsx_self_closing_element = '{/* %s */}',
          comment = '// %s',
       },
       typescript = { __default = '// %s', __multiline = '/* %s */' },
   }
   }
});
