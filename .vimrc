"line numbers and relative line numbers
set nu
set relativenumber

set termguicolors

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set smartindent

set nowrap

set noswapfile

set nohlsearch
set incsearch

set termguicolors

set scrolloff=8

set updatetime=50

" statusline setup
set laststatus=2

set statusline=
set statusline+=%#LineNr# " color 1
set statusline+=%#PmenuSel# " color 2
set statusline+=\ %f
set statusline+=%m

set statusline+=%=

set statusline+=%#CursorColumn# " color 3
set statusline+=\ %y " filetype
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding} 
" set statusline+=\[%{&fileformat}\]
set statusline+=\ (%l:%c)

let g:netrw_banner = 0
let g:netrw_liststyle = 3

colorscheme alduin

" Remaps
let g:mapleader = " "

nnoremap <leader>e :Ex<CR>

" vim.keymap.set('n', 'J', 'mzJ`z', {desc = "Merge Next Line"})
" 
" -- preserved paste
xnoremap <leader>pp' \"_dP

" -- yank to system clipboard
nnoremap <leader>y \"+y
vnoremap <leader>y \"+y

" file management
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

tnoremap <Esc> <C-\><C-n>

" window changes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-=> <C-w>> " expand window
nnoremap <C--> <C-w>< " shrink window

" extension select, owo is kinda cute lol
vnoremap <M-w> owo
vnoremap <M-e> oeo
vnoremap <M-W> oWo
vnoremap <M-E> oEo

