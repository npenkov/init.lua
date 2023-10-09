require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '-u' -- thats the new thing
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    
            override_generic_sorter = true,  
            override_file_sorter = true,     
            case_mode = "smart_case",        
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('dir')
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
