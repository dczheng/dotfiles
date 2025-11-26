set nocompatible
set nospell
set nu
set cursorline
set mouse=a
set autochdir
set fileencodings=utf-8,gbk,gb2313
set termencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set autoindent
set hlsearch
set laststatus=2
set nofoldenable
set foldlevel=1
set tabstop=4
set shiftwidth=4
set expandtab
set viminfo+=n~/.cache/vim/info

set nobackup
set noswapfile
set nowritebackup

set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.cache/vim/undo
call mkdir(&undodir, "p", 0700)

colorscheme koehler
setlocal foldmethod=indent
syntax on

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html inoremap <div> <div><CR></div><ESC>O
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType make set noexpandtab
autocmd FileType yaml set tabstop=2 shiftwidth=2
autocmd BufReadPost * {
    if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal! g'\""
    endif
}

inoremap { {<CR>}<ESC>O
inoremap /* /**/<ESC>hi

highlight CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
highlight Normal ctermfg=NONE ctermbg=NONE
highlight statusline ctermfg=6 ctermbg=NONE
set statusline=%F\ %y\ %r\ %m\ %=\%3p%%\ Row:\%-4l\ Col:%-4c\ Line:\ %L
