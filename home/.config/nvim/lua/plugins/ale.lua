vim.g.ale_fix_on_save = 1
vim.g.ale_disable_lsp = 1
vim.g.ale_fixers = {
    go = {"gofmt"}
}

--vim.cmd([[
--    call deoplete#custom#option('sources', {
--      \ '_': ['ale', 'foobar'],
--    \})
--    set omnifunc=ale#completion#OmniFunc
--]])
