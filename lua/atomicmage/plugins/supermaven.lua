local M = {}

M.setup = function()
  return {
    'supermaven-inc/supermaven-nvim',
    lazy = false,
    config = function()
      require("supermaven-nvim").setup({
        disable_inline_completion = true
      })
    end,
  }
end

return M
