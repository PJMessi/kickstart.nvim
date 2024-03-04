local M = {}

M.setup = function()
  return {
    'tpope/vim-fugitive',
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
    end,
  }
end

return M
