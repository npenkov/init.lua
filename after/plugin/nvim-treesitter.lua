require'nvim-treesitter.configs'.setup {
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "cpp", "java", "kotlin", "python", "markdown" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
