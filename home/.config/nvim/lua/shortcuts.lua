function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

map("n", "<esc>", ":noh<CR>")
map("n", "<C-c>", ":TagbarToggle<CR>")

--vim.cmd([[
--    if has('nvim')
--        inoremap <silent><expr> <c-space> coc#refresh()
--    else
--        inoremap <silent><expr> <c-@> coc#refresh()
--    endif
--]])
--map("n", "<C-d>", ":call Show_documentation()<CR>")
--map("n", "<C-f>", ":CocCommand explorer<CR>")
--map("n", "gd", ":call CocActionAsync('jumpDefinition')<cr>")
--map("n", "gy", ":call CocActionAsync('jumpTypeDefinition')<cr>")
--map("n", "gi", ":call CocActionAsync('jumpImplementation')<cr>")
--map("n", "gr", ":call CocActionAsync('jumpReferences')<cr>")
--map("n", "gf", "<Plug>(coc-dialog-menu)")
--map("n", "<C-x>", ":CocList diagnostics<CR>")
--vim.cmd([[
--    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
--]])

map("n", "<F2>", ":UndotreeToggle<CR>")

map("n", "<C-s>", ":Telescope find_files<CR>")
map("n", "<C-b>", ":Telescope buffers<CR>")

map("i", "<Tab>", "<C-t>")
map("i", "<S-Tab>", "<C-d>")

map("n", "<C-f>", ":NeoTreeFocusToggle<CR>")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
