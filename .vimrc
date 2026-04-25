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
nnoremap <M-h> :call ToggleTerm()<CR>

function! ToggleTerm()
    if bufexists(g:term_buf)
        if bufwinnr(g:term_buf) != -1
            execute bufwinnr(g:term_buf) . 'hide'
        else
            execute 'sbuffer ' . g:term_buf
        endif
    else
        terminal
        let g:term_buf = bufnr('%')
    endif
endfunction

autocmd TerminalOpen * tnoremap <M-h> <C-\><C-n>:call ToggleTerm()<CR>

" nnoremap <M-h> :term<CR>

" allows Esc to escape terminal

autocmd TerminalOpen * setlocal nonumber norelativenumber
autocmd TerminalOpen * tnoremap <Esc> <C-\><C-n>
" autocmd TerminalOpen * tnoremap <M-h> <C-\><C-n>:hide<CR>


