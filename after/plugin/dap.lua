require("dapui").setup()

-- Load DAP configs only from local project folder
-- By default the paths ./nvim-dap.lua, ./.nvim-dap/nvim-dap.lua 
-- and .nvim/nvim-dap.lua are searched for. 
require('nvim-dap-projects').search_project_config()

-- Keymaps
vim.keymap.set('n', '<leader>dh',
               function() require"dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dH',
               ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set({'n', 't'}, '<F8>', function() require"dap".step_out() end)
vim.keymap.set({'n', 't'}, "<F7>", function() require"dap".step_into() end)
vim.keymap.set({'n', 't'}, '<F6>', function() require"dap".step_over() end)
vim.keymap.set({'n', 't'}, '<F5>', function() require"dap".continue() end)
vim.keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>dc', function() require"dap".terminate() end)
vim.keymap.set('n', '<leader>dR',
               function() require"dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>de',
               function() require"dap".set_exception_breakpoints({"all"}) end)
vim.keymap.set('n', '<leader>da', function() require"debugHelper".attach() end)
vim.keymap.set('n', '<leader>dA',
               function() require"debugHelper".attachToRemote() end)
vim.keymap
    .set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>d?', function()
    local widgets = require "dap.ui.widgets";
    widgets.centered_float(widgets.scopes)
end)
vim.keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>dr',
               ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
vim.keymap.set('n', '<leader>du', ':lua require"dapui".toggle()<CR>')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
vim.keymap.set('n', '<leader>ds', ':Telescope dap frames<CR>')
-- vim.keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
vim.keymap.set('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

require("nvim-dap-virtual-text").setup {
    enabled = true,                        
    enabled_commands = true,               
    highlight_changed_variables = true,    
    highlight_new_as_changed = false,      
    show_stop_reason = true,               
    commented = false,                     
    only_first_definition = true,          
    all_references = false,                
    clear_on_continue = false,             
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,
    virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

    all_frames = false,                    
    virt_lines = false,                    
    virt_text_win_col = nil                
}

-- setup dap-go helper
require('dap-go').setup()
