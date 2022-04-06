""""""""""""""""""
"" Plugins List """
""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'MTDL9/vim-log-highlighting'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'yuezk/vim-js'
Plug 'vimsence/vimsence'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'LnL7/vim-nix'
Plug 'wakatime/vim-wakatime'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
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

set omnifunc=ale#completion#OmniFunc

"""""""""""""""
"" Shortcuts ""
"""""""""""""""

" Generic
nnoremap <C-K> :call HighlightNearCursor()<CR>
function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Todo /\k*\%"\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction

nmap <C-c> :TagbarToggle<CR>
nmap <C-x> :bdelete .
cmap w!! w !sudo tee > /dev/null %

" coc-explorer
nmap <C-f> :CocCommand explorer<CR>

" coc.nvim
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <C-space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeFind<CR>

" CocExplorer
" Use preset argument to open it
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <space>el :CocList explPresets

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

nmap <C-s> :w <CR>

" coc.nvim
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

" Emmet
let g:user_emmet_leader_key=','

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' }, 'sources', { '_': ['ale', 'foobar'], })

""""""""""""
"" Themes ""
""""""""""""
let g:onedark_termcolors = 16
colorscheme dracula
