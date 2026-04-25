return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<C-\\>', desc = 'Toggle terminal' },
  },
  opts = {
    open_mapping = '<C-\\>',
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = function()
        return math.floor(vim.o.columns * 0.95)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.85)
      end,
    },
    shade_terminals = false,
    shell = 'tmux new-session -A -s popup',
  },
}
