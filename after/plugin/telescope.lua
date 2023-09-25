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
