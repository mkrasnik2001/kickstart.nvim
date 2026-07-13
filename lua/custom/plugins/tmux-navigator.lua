-- Seamless navigation between nvim splits and tmux panes.
--  C-hjkl moves between nvim windows; when there is no nvim split in that
--  direction, it crosses into the adjacent tmux pane instead (and vice versa,
--  thanks to the matching is_vim snippet in ~/.config/tmux/tmux.conf).
--
--  NOTE: We intentionally do NOT map <C-\> (the plugin's default "previous
--  pane" key) because it belongs to ToggleTerm in this config.
return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
  },
  keys = {
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Navigate left (nvim/tmux)' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Navigate down (nvim/tmux)' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Navigate up (nvim/tmux)' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Navigate right (nvim/tmux)' },
  },
}
