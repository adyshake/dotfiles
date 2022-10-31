" Run this command to install Vim Plug first, then run :PlugInstall
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" CoC instructions
" :CocInstall coc-pyright
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
"set number

" Add relative line numbers to the left-hand side.
set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.

call plug#begin('~/.vim/plugged')

Plug 'pseewald/vim-anyfold'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Anyfold (anyfold) ------------------------------------------------------ {{{"
autocmd Filetype python,java AnyFoldActivate  " turn this on for Java"
set foldlevel=4 " close all folds
"let g:anyfold_identify_comments=2 " more rigor to identify comments"
"let g:anyfold_fold_comments=1 " fold comments by default"
"let g:anyfold_comments=['comment','string','external','include']
" ------------------------------------------------------------------------ }}}"

" CoC (coc.nvim) --------------------------------------------------------- {{{"
set hidden
set nowritebackup
set updatetime=300            " ...so screen draws don't lag"
set shortmess+=c              " Don't pass messages to |ins-completion-menu|"
set signcolumn=yes            " Always show signedcolumn"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window."
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" ------------------------------------------------------------------------ }}}"


call plug#end()

let g:gruvbox_italic=0
colorscheme gruvbox

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-k> :GFiles?<CR>
nnoremap <C-g> :Ag<Cr>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

