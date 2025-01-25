vim.opt.encoding = "utf-8"
vim.cmd("filetype plugin indent on")
vim.opt.termguicolors = true

vim.opt.number = true
vim.cmd("set number relativenumber")
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.mouse = "a"

vim.opt.backup = false

--vim.opt.updatetime = 100
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100

vim.opt.hidden = true

vim.opt.autoread = true

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end
    end
})

