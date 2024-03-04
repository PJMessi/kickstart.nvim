local M = {}

M.setup = function(opts)
  return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():append()
      end)
      vim.keymap.set('n', '<leader>hh', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end)
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<leader>hn', function()
        harpoon:list():next()
      end)
      vim.keymap.set('n', '<leader>hc', function()
        harpoon:list():clear()
      end)
    end,
  }
end

return M
