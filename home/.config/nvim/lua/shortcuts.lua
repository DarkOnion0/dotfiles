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
--map("i", "<c-space>", ":call coc#refresh()<CR>")
map("n", "<C-d>", ":call Show_documentation()<CR>")
map("n", "<C-f>", ":CocCommand explorer<CR>")
map("n", "gd", ":call CocAction('jumpDefinition')<cr>")
map("n", "gy", ":call CocAction('jumpTypeDefinition')<cr>")
map("n", "gi", ":CocAction('jumpImplementation')<cr>")
map("n", "gr", ":call CocAction('jumpReferences')<cr>")

map("n", "<F2>", ":UndotreeToggle<CR>")

map("n", "<C-s>", ":Files<CR>")
map("n", "<C-b>", ":Buffers<CR>")

map("i", "<Tab>", "<C-t>")
map("i", "<S-Tab>", "<C-d>")
