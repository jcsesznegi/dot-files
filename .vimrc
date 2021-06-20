" File: .vimrc
" Version: 1
" Author: Jason Csesznegi
" Description: VIM configuration file
" Updated: August 18 2019

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" file search
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" theme
colorscheme jellybeans
set guifont=Monaco:h10 noanti

" airline
let g:airline_theme='jellybeans'

" indent guides
let g:indent_guides_enable_on_vim_startup = 1

" do not highlight matched brackets on enter
let g:loaded_matchparen = 1

" paste toggle
set pastetoggle=<f5>

" Pathogen
execute pathogen#infect()

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" search
set smartcase
set incsearch

" explorer settings
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=3

" fix delete button behavior
set backspace=indent,eol,start

" fix tabs to use spaces
autocmd FileType html setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
retab

" set scss files to use tabs
" autocmd FileType scss set tabstop=2|set shiftwidth=2|set noexpandtab

" number lines and use auto-indent
set number
set autoindent

" set to write no backups
set nobackup
set nowritebackup

" auto read file after external update (such as lint)
set autoread
au CursorHold,CursorHoldI * checktime

" keep 150 lines of command line history
set history=150

" show the cursor position all the time
set ruler

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" highlight strings inside C comments
let c_comment_strings=1

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" fzf
set rtp+=~/.fzf
nnoremap <C-p> :FZF<Cr>

" allow pasting from system clipboard (* must use vim-gtk in Linux Mint)
set clipboard=unnamedplus

" tpope/vim-surround
" tpope/vim-abolish
" tpope/vim-commentary
" tpope/vim-unimpaired
" tpope/vim-vinegar
" godlygeek/tabular
" plasticboy/vim-markdown
" AndrewRadev/splitjoin.vim
" dense-analysis/ale
" mxw/vim-jsx
" ntpeters/vim-better-whitespace
" nelstrom/vim-visual-star-search
" leafgarland/typescript-vim
" mattn/emmet-vim
" jiangmiao/auto-pairs
" pbrisbin/vim-mkdir

" use concealing for markdown files
autocmd FileType markdown set conceallevel=2

" ale settings
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=red ctermfg=black
highlight ALEWarningSign ctermbg=yellow ctermfg=black
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1

" ******************************************************************************
" Key Mappings
" ******************************************************************************
map <Leader>e :Explore<cr>

" smooth scroll
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

" remap ESC key
imap jj <Esc>

" ******************************************************************************
" Abbreviations
" ******************************************************************************

" abbreviation to manually enter a timestamp. Just type YTS in insert mode

iab YTS <C-R>=TimeStamp()<CR>

" Date/Time stamps
" %a - Day of the week
" %b - Month

" %d - Day of the month
" %Y - Year
" %H - Hour
" %M - Minute
" %S - Seconds
" %Z - Time Zone

iab YDATETIME <c-r>=strftime(": %a %b %d, %Y %H:%M:%S %Z")<cr>

" ******************************************************************************
" Other
" ******************************************************************************

" automatically open quickfix window after grep
augroup AutoQuickfix
	autocmd!
	autocmd QuickFixCmdPost *grep* cwindow
augroup END

" Use C-d, C-u to navigate, C-c to close the quickfix list
" nnoremap <silent> <C-d> :<C-u>cnext<CR>
" nnoremap <silent> <C-u> :<C-u>cprev<CR>
" nnoremap <silent> <C-c> :<C-u>cclose<CR>
