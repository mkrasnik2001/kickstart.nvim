return {
  {
    'benlubas/molten-nvim',
    version = '^1.0.0',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'GCBallesteros/jupytext.nvim',
    },
    init = function()
      vim.g.molten_image_provider = 'wezterm'
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_output_win_max_height = 20
    end,
    keys = {
      { '<localleader>jr', ':MoltenReevaluateCell<CR>', desc = 'Re-eval cell', silent = true },
      { '<localleader>jv', ':<C-u>MoltenEvaluateVisual<CR>gv', mode = 'v', desc = 'Eval visual', silent = true },
      { '<localleader>jo', ':noautocmd MoltenEnterOutput<CR>', desc = 'Open output', silent = true },
      { '<localleader>jh', ':MoltenHideOutput<CR>', desc = 'Hide output', silent = true },
      { '<localleader>jd', ':MoltenDelete<CR>', desc = 'Delete cell', silent = true },
    },
    config = function()
      -- Auto-init kernel and import outputs when opening .ipynb
      vim.api.nvim_create_autocmd('BufAdd', {
        pattern = { '*.ipynb' },
        callback = function(e)
          vim.schedule(function()
            local kernels = vim.fn.MoltenAvailableKernels()
            local ok, kernel_name = pcall(function()
              local f = io.open(e.file, 'r')
              if not f then return nil end
              local content = f:read('*a')
              f:close()
              return vim.json.decode(content)['metadata'].kernelspec.name
            end)
            if not ok or not vim.tbl_contains(kernels, kernel_name) then
              kernel_name = nil
              local venv = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX')
              if venv then
                kernel_name = string.match(venv, '/.+/(.+)')
              end
            end
            if kernel_name and vim.tbl_contains(kernels, kernel_name) then
              vim.cmd(('MoltenInit %s'):format(kernel_name))
            end
            vim.cmd('MoltenImportOutput')
          end)
        end,
      })

      -- Export outputs on save
      vim.api.nvim_create_autocmd('BufWritePost', {
        pattern = { '*.ipynb' },
        callback = function()
          if require('molten.status').initialized() == 'Molten' then
            vim.cmd('MoltenExportOutput!')
          end
        end,
      })
    end,
  },
  {
    'GCBallesteros/jupytext.nvim',
    config = function()
      require('jupytext').setup {
        style = 'markdown',
        output_extension = 'md',
        force_ft = 'markdown',
      }
    end,
  },
  {
    'willothy/wezterm.nvim',
    config = true,
  },
}
