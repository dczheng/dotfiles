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

set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.cache/vim/undo
call mkdir(&undodir, "p", 0700)

set directory=~/.cache/vim/swap
call mkdir(&directory, "p", 0700)

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

if has("cscope")
        let s:dirs = split(getcwd(), "/")
        while s:dirs != []
                let s:path = "/" . join(s:dirs, "/")
                if (filereadable(s:path . "/cscope.out"))
                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                        break
                endif
                let s:dirs = s:dirs[:-2]
        endwhile

        set csto=0  " Use cscope first, then ctags
        set cst     " Only search cscope
        set csverb  " Make cs verbose

        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>

        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif
