return {
  'nelnn/bear.nvim',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  ft = { 'python' },
  opts = {
    cache_dir = '~/.cache/nvim/bear',
    remove_file = true,
    window = {
      width = 0.9,
      height = 0.8,
      border = 'rounded',
    },
    keymap = {
      visualise = '<leader>df',
      visualise_buf = '<leader>bdf',
      exit_terminal_mode = '<C-o>',
    },
  },
}
