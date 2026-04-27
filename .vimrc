" TODO:
" 1. Allow toggle for netrw <leader>e


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

set ignorecase 
set smartcase

set termguicolors

set showmatch

set scrolloff=8

set updatetime=50

set colorcolumn=90

hi ColorColumn guifg=#202020 guibg=#191919
hi ColorColumn ctermfg=lightgray ctermbg=lightgray
hi TooLongMarker ctermbg=magenta guibg=#5f7a41 gui=underline
call matchadd('TooLongMarker', '\%90v', 100)

" enable mouse features for normal and visual mode only
set mouse=nv

" new opened files override unsave changes
set hidden

" statusline setup
set laststatus=2

function! MainStatusLine() abort
    let l:segments = []

    call add(l:segments, "%#CursorColumn#")
    call add(l:segments, "█")

    call add(l:segments, " ")

    if &buftype ==# 'terminal'
        call add(l:segments, "Terminal")
        call add(l:segments, "%=")

    else
        call add(l:segments, "%#CursorColumn#")

        call add(l:segments, "<%{bufnr()}>")

        call add(l:segments, " ")
        call add(l:segments, "%f")
        call add(l:segments, "%h%w%m%r")

        call add(l:segments, "%#LineNr# ")
        call add(l:segments, "%=")

        call add(l:segments, "%#CursorColumn#")
        call add(l:segments, " %y")
        call add(l:segments, " %LL")

        call add(l:segments, " (%l:%c)")
    endif

    call add(l:segments, " ")
    call add(l:segments, "%#CursorColumn#")
    call add(l:segments, "█")

    return join(l:segments, "")
endfunction

set statusline=%!MainStatusLine()

" syntax on

" Map leader
let g:mapleader = " "

" ===== netrw setup =====
let g:netrw_banner = 0
let g:netrw_liststyle = 4

" easier access
nnoremap <leader>e :Ex<CR>

" merge next line
nnoremap J mzJ`z

" fast indent
nnoremap H mzV<`z
nnoremap L mzV>`z

vnoremap H <gv
vnoremap L >gv

" fast linemove
vnoremap J :m '>+1<CR>gv
" moving up requires 2 for 1 line
vnoremap K :m '<-2<CR>gv

" preserved paste
xnoremap <leader>pp "_dP

" yank to system clipboard (only for vim that is compiled with +clipboard support)
nnoremap <leader>y \"+y
vnoremap <leader>y \"+y

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

vnoremap <M-w> owo
vnoremap <M-e> oeo
vnoremap <M-W> oWo
vnoremap <M-E> oEo



" ====== terminal ======
let g:term_buf = -1

function! TryCloseTerm()
    if bufexists(g:term_buf)
        execute 'bwipeout! ' . g:term_buf
    endif
endfunction

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

function! s:setup_term()
    setlocal nonumber norelativenumber

    " for terminals which cannot reliably send the meta key
    tnoremap <C-t> <C-\><C-n>:silent call ToggleTerm()<CR>
    tnoremap <M-h> <C-\><C-n>:silent call ToggleTerm()<CR>

    " allows Esc to escape terminal
    tnoremap <Esc> <C-\><C-n>
endfunction

" for terminals which cannot reliably send the meta key
nnoremap <C-t> :silent call ToggleTerm()<CR>
nnoremap <M-h> :silent call ToggleTerm()<CR>

autocmd TerminalOpen * :silent call s:setup_term()
autocmd QuitPre * :silent call TryCloseTerm()


" ===== plugin settings ===== "
filetype plugin on

" sneak
let g:sneak#label = 1

" fallback
" colorscheme alduin

packadd! sonokai
let g:sonokai_style = "shusia"
let g:sonokai_better_performance = 1
colorscheme sonokai

" CtrlP
let g:ctrlp_show_hidden = 1 " show hidden files
nnoremap <leader><leader> :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" undotree
nnoremap <leader>u :UndotreeToggle<CR>

packloadall

silent! helptags ALL

