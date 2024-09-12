local M = {}

M.setup = function()
  return { -- Autocompletion
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = {

    },
    config = true,
  }
end

return M
