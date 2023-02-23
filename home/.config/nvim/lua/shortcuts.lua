function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

map("n", "<esc>", ":noh<CR>")
map("n", "<C-c>", ":TagbarToggle<CR>")
vim.cmd([[
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif
]])
map("n", "<C-d>", ":call Show_documentation()<CR>")
map("n", "<C-f>", ":CocCommand explorer<CR>")
map("n", "gd", ":call CocActionAsync('jumpDefinition')<cr>")
map("n", "gy", ":call CocActionAsync('jumpTypeDefinition')<cr>")
map("n", "gi", ":call CocActionAsync('jumpImplementation')<cr>")
map("n", "gr", ":call CocActionAsync('jumpReferences')<cr>")
map("n", "gf", "<Plug>(coc-dialog-menu)")
map("n", "<C-x>", ":CocList diagnostics<CR>")
vim.cmd([[
    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
]])
map("n", "<F2>", ":UndotreeToggle<CR>")

map("n", "<C-s>", ":Telescope find_files<CR>")
map("n", "<C-b>", ":Telescope buffers<CR>")

map("i", "<Tab>", "<C-t>")
map("i", "<S-Tab>", "<C-d>")
