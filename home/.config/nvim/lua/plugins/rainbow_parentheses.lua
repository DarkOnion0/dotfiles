vim.cmd([[
    augroup rainbow_lisp
        autocmd!
        autocmd FileType javascript,go,bash,fish,lua,html,css,scss RainbowParentheses
    augroup END
]])

vim.cmd("let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]")
