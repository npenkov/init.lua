local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'clangd',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- lspconfig
local lspconfig = require('lspconfig')

-- Rust
lspconfig.rust_analyzer.setup({})

-- Terraform
lspconfig.terraformls.setup{}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Python
-- Setting up pynvim
-- 1. Create a VIRTUAL_ENV - 
--    ```sh
--    python3 -m venv ~/.python-envs/pynvim/ 
--    ```
-- 2. Install pynvim
--   ```sh
--   source ~/.python-envs/pynvim/bin/activate
--   pip install pynvim
--   ```
-- 3. Set the python3_host_prog to the VIRTUAL_ENV
vim.g.python3_host_prog = '$HOME/.python-envs/pynvim/bin/python3'
lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            cmd = {"pyls"};
            cmd_env = {VIRTUAL_ENV = "$HOME/.python-envs/pynvim"};
            plugins = {
                pycodestyle = {
                    ignore = {'W391'},
                    maxLineLength = 100
                }
            }
        }
    }
}


-- nvim-cmp
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- Trigger completion with <C-Space>
local cmp_config = {
  completion = {
    autocomplete = false
  },
  mapping = cmp_mappings,
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  }
}

lsp.setup_nvim_cmp(cmp_config)

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

require('lspconfig').clangd.setup({})
