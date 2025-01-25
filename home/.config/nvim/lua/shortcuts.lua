function map(mode, shortcut, command, noremap)
    local noremap = noremap or true
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = noremap, silent = true })
end

map("n", "<esc>", ":noh<CR>", false)
map("n", "<esc>", ":NoiceDismiss<CR>", false)

map("n", "<C-c>", ":Lspsaga outline<CR>")

map("n", "<C-t>", "<cmd>Lspsaga term_toggle<CR>")
map("t", "<C-t>", "<cmd>Lspsaga term_toggle<CR>")

map("n", "gn", ":bn<CR>")
map("n", "gp", ":bp<CR>")
map("n", "gN", ":tabnext<CR>")
map("n", "gP", ":tabprevious<CR>")

map("n", "gl", "$")
map("v", "gl", "$")
map("n", "gh", "0")
map("v", "gh", "0")

map("n", "<F2>", ":UndotreeToggle<CR>")

map("n", "<space>f", ":Telescope find_files<CR>")
map("n", "<space>F", ":Telescope live_grep<CR>")
map("n", "<space>b", ":Telescope buffers<CR>")

map("i", "<Tab>", "<C-t>")
map("i", "<S-Tab>", "<C-d>")

map("n", "<C-f>", ":NeoTreeFocusToggle<CR>")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>q", ":Telescope diagnostics<CR>")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Diagnostic & Co
        vim.keymap.set("n", "<space>a", "<cmd>Lspsaga code_action<CR>")
        vim.keymap.set("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
        vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
        vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")

        -- Code definitions & Co
        local opts = { buffer = ev.buf, silent = true }
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
        vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<CR>", opts)
        vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>", opts)
        vim.keymap.set("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>", opts)
        vim.keymap.set("n", "<space>k", vim.lsp.buf.hover, opts)

        -- Code finder & Co
        vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>s", ":Telescope lsp_document_symbols<CR>", opts)
        vim.keymap.set("n", "<space>S", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)

        -- Others
        -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set("n", "<space>wl", function()
        -- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<space>j", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
