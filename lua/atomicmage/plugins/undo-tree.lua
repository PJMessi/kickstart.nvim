local M = {}

M.setup = function()
  return {
    'mbbill/undotree',
    lazy = false,
    cmd = { "UndotreeToggle" },
    config = function()
      vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })
    end,
  }
end

return M
