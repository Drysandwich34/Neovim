return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = 'rafamadriz/friendly-snippets',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'none',
      ['<CR>'] = { 'accept', 'fallback' },
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<C-j>'] = { 'select_prev', 'fallback' },
      ['<C-k>'] = { 'select_next', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}
