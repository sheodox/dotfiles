lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"javascript", "typescript", "html", "bash", "css", "scss", "svelte", "python", "json", "query", "ruby"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

