"line numbers and relative line numbers
set number
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

set mouse=nv

" new opened files override unsave changes
set hidden

" statusline setup
set laststatus=2

set statusline=
set statusline+=%#PmenuSel# " color 2
set statusline+=%#CursorColumn#
set statusline+=█

set statusline+=%#CursorColumn#

set statusline+=\ " space

set statusline+=%f
set statusline+=%h%w%m%r

set statusline+=%#LineNr# " color 1
set statusline+=%=

set statusline+=%#CursorColumn#
set statusline+=\ %y " filetype
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding} 
" set statusline+=\[%{&fileformat}\]
set statusline+=\ (%l:%c)

set statusline+=\ " space

set statusline+=%#PmenuSel# " color 2
set statusline+=%#CursorColumn#
set statusline+=█

syntax on

" Map leader
let g:mapleader = " "

" ===== netrw setup =====
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" easier access
nnoremap <leader>e :Ex<CR>

colorscheme alduin

" merge next line
nnoremap J mzJ`z

" fast indent
nnoremap H mzV<`z
nnoremap L mzV>`z

vnoremap H <gv
vnoremap L >gv

" -- preserved paste
xnoremap <leader>pp' \"_dP

" -- yank to system clipboard (only for vim that is compiled with +clipboard support)
" nnoremap <leader>y \"+y
" vnoremap <leader>y \"+y

" file management
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" window changes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" expand window
nnoremap <C-=> <C-w>>

" shrink window
nnoremap <C--> <C-w><

" extension select, owo is kinda cute lol
vnoremap <M-w> owo
vnoremap <M-e> oeo
vnoremap <M-W> oWo
vnoremap <M-E> oEo



" ====== terminal ======
let g:term_buf = -1

function! s:toggle_term()
    if bufexists(g:term_buf)
        execute 'sbuffer ' . g:term_buf
    else
        terminal
        let g:term_buf = bufnr('%')
    endif
endfunction

function! s:setup_term()
    setlocal nonumber norelativenumber

    tnoremap <M-h> <C-\><C-n>:call s:toggle_term()<CR>

    " allows Esc to escape terminal
    tnoremap <Esc> <C-\><C-n>
endfunction

nnoremap <M-h> :call s:toggle_term()<CR>

autocmd TerminalOpen * :call s:setup_term()

