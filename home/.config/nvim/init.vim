""""""""""""""""""
"" Plugins List """
""""""""""""""""""
call plug#begin('~/.vim/plugged')
" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'vimsence/vimsence'
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'preservim/tagbar'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" WEB
Plug 'mattn/emmet-vim'
Plug 'yuezk/vim-js'

" Log
Plug 'MTDL9/vim-log-highlighting'

" Markdown
Plug 'junegunn/vim-emoji'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Nix
Plug 'LnL7/vim-nix'

" Editor
"Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'wakatime/vim-wakatime'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

"""""""""""""""""""""
"" Editor Settings ""
"""""""""""""""""""""

syntax enable
filetype plugin indent on
set encoding=utf-8

set number relativenumber
set termguicolors
set cursorcolumn
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab

set mouse=a

set nobackup

set updatetime=100

"set omnifunc=ale#completion#OmniFunc

"""""""""""""""
"" Shortcuts ""
"""""""""""""""

" Generic
map <esc> :noh <CR>

nnoremap <C-c> :TagbarToggle<CR>
nmap <C-x> :bdelete .
cmap w!! w !sudo tee > /dev/null %

"nnoremap <C-d> :ALEHover<CR>

" Coc
inoremap <silent><expr> <c-space> coc#refresh()
" Use K to show documentation in preview window.
nnoremap <silent> <C-d> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)<cr>
nmap <silent> gy <Plug>(coc-type-definition)<cr>
nmap <silent> gi <Plug>(coc-implementation)<cr>
nmap <silent> gr <Plug>(coc-references)<cr>

" Coc-explorer
nnoremap <C-f> :CocCommand explorer<CR>

""""""""""""""""""""""
"" Plugins settings ""
""""""""""""""""""""""

" Vimsence
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set listchars=eol:$,tab:>·,trail:~,space:␣
set list

" coc explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Coc 
let g:coc_global_extensions = [ 'coc-browser', 'coc-docker', 'coc-json', 'coc-sh', 'coc-fish', 'coc-yaml', 'coc-emmet', 'coc-html', 'coc-html-css-support', 'coc-highlight', 'coc-marketplace', 'coc-prettier', 'coc-snippets', 'coc-go', 'coc-css', 'coc-explorer', 'coc-git', 'coc-tsserver']

" Coc-git
let b:coc_git_blame = 1

" Emmet
let g:user_emmet_leader_key=','

" Deoplete
let g:deoplete#enable_at_startup = 0
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' }, 'sources', { '_': ['ale', 'foobar'], })

" Ale
let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1
let b:ale_fixers = {
\   'go': ['gofmt'],
\}

" vim-go
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1

let g:go_gopls_enabled = 1
let g:go_gopls_options=['-remote=auto']

""""""""""""
"" Themes ""
""""""""""""
let g:onedark_termcolors = 24
let g:onedark_terminal_italics = 1
colorscheme onedark
