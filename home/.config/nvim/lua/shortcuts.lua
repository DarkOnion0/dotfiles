function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

map("n", "<esc>", ":noh<CR>")
map("n", "<C-c>", ":TagbarToggle<CR>")
map("n", "<c-space>", "coc#refresh()<CR>")
map("n", "<C-d>", ":call Show_documentation()<CR>")
map("n", "<C-f>", ":CocCommand explorer<CR>")
map("n", "gd", "<Plug>(coc-definition)<cr>")
map("n", "gy", "<Plug>(coc-type-definition)<cr>")
map("n", "gi", "<Plug>(coc-implementation)<cr>")
map("n", "gr", "<Plug>(coc-references)<cr>")
