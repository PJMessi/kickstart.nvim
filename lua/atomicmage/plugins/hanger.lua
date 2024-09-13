local M = {}

M.setup = function()
  return {
    'https://github.com/PJMessi/hanger',
    -- dir = "/Users/prajwalshrestha/projects/personal/nvim/hanger",
    lazy = false,
    cmd = { "CPath", "Greet", "RunSingleTest", "RerunSingleTest","RunFileTests" },
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>rt', ':RunSingleTest<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>rrt', ':RerunSingleTest<CR>', { noremap = true, silent = true })
    end,
  }
end

return M
