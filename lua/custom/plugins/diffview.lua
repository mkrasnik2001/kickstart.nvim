return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview: open (working tree vs index)' },
    { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Diffview: close' },
    { '<leader>gm', function()
      vim.ui.input({ prompt = 'Diff against branch: ', default = 'origin/main' }, function(branch)
        if branch and branch ~= '' then
          vim.cmd('DiffviewOpen ' .. branch .. '...HEAD')
        end
      end)
    end, desc = 'Diffview: branch vs <branch> (defaults to origin/main)' },
    { '<leader>gM', function()
      vim.ui.input({ prompt = 'Commit list against branch: ', default = 'origin/main' }, function(branch)
        if branch and branch ~= '' then
          vim.cmd('DiffviewFileHistory --range=' .. branch .. '..HEAD')
        end
      end)
    end, desc = 'Diffview: commits on branch vs <branch> (defaults to origin/main)' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'Diffview: branch history' },
    { '<leader>gH', '<cmd>DiffviewFileHistory --follow %<cr>', desc = 'Diffview: current file history' },
    { '<leader>gC', function()
      vim.ui.input({ prompt = 'Commit SHA: ' }, function(sha)
        if sha and sha ~= '' then
          vim.cmd('DiffviewOpen ' .. sha .. '^!')
        end
      end)
    end, desc = 'Diffview: show a specific commit' },
  },
}
