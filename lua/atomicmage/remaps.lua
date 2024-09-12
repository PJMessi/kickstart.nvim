-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- atomicmage
vim.keymap.set('c', '<M-BS>', '<C-w>', { noremap = true, desc = 'Delete a word before the cursor' })
vim.keymap.set('i', '<M-BS>', '<C-w>', { noremap = true, desc = 'Delete a word before the cursor' })
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = "Open Vim's default explore in current buffer" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move the selection downward by 1 line' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move the selection upward by 1 line' })


-- Function to get the name of the Go test function surrounding the cursor
function GetGoTestFuncName()
  local current_line = vim.fn.line(".") -- Get the current line number
  local func_name = nil

  -- Search backwards for a line that starts with 'func Test' and matches Go test naming conventions
  for i = current_line, 1, -1 do
    local line = vim.fn.getline(i)
    -- Print each line being searched for debugging purposes
    -- print("Checking line:", line)

    -- Pattern to match a Go test function like 'func TestSomething(...)'
    local match = string.match(line, "^%s*func%s+(Test[%w_]+)%s*%(")
    if match then
      func_name = match
      -- print("Matched function:", func_name) -- Debugging: print matched function
      break
    end
  end

  if func_name then
    return func_name
  else
    print("no test function found")
    return nil
  end
end

-- Function to run the Go test for the current function
function RunSingleTest()
  local file_ext = vim.fn.expand("%:e")
  if file_ext == "go" then
    local func_name = GetGoTestFuncName()
    if not func_name then return end -- Exit if no test function is found

    -- Get the current file directory name
    local dirname = vim.fn.expand("%:p:h")

    -- Build the command to run the specific test function
    local cmd = "make test-single name=" .. func_name .. " path=" .. dirname

    print(cmd)

    -- Open a new split terminal and run the command
    vim.cmd("split")
    vim.cmd("term " .. cmd)
  else
    print("Test not configured")
    return
  end
end

-- Map the function to a keybinding
vim.api.nvim_set_keymap('n', '<leader>rt', ':lua RunSingleTest()<CR>', { noremap = true, silent = true })

-- indent without exiting visual mode
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })


