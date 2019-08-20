map 4 ms:call AddAuthor()<cr>

" Turn on syntax highlighting.
syntax enable

" Encoding
set encoding=utf-8

function AddAuthor()
    let n=1
    while n < 11
        let line = getline(n)
        if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
        call UpdateTitle()
        return
    endif
    let n = n + 1
    endwhile
    if &filetype == 'sh'
        call AddTitleForShell()
    elseif &filetype == 'zsh'
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    elseif &filetype == 'java'
        call AddTitleForJava()
    elseif &filetype == 'tex'
        call AddTitleForLatex()
    else
        call AddTitleForC()
    endif

endfunction


function UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal mk
    execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." |echohl None
endfunction

function AddTitleForC()
    call append(0,"/* *********************************************************")
    call append(1," * Author        : LEI Sen")
    call append(2," * Email         : sen.lei@outlook.com")
    call append(3," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," * Filename      : ".expand("%:t"))
    call append(6," * Description   : ")
    call append(7," * ****************************************************** */")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

function AddTitleForJava()
    call append(0,"/* *********************************************************")
    call append(1," * Author        : LEI Sen")
    call append(2," * Email         : sen.lei@outlook.com")
    call append(3," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," * Filename      : ".expand("%:t"))
    call append(6," * Description   : ")
    call append(7," * ****************************************************** */")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

function AddTitleForPython()
    call append(0,"#!/Users/leisen/anaconda3/bin/python3")
"    call append(0,"# ")
    call append(1,"# -*- coding: UTF-8 -*-")
    call append(2,"")
    call append(3,"# ********************************************************")
    call append(4,"# * Author        : LEI Sen")
    call append(5,"# * Email         : sen.lei@outlook.com")
    call append(6,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"# * Filename      : ".expand("%:t"))
    call append(9,"# * Description   : ")
    call append(10,"# *********************************************************")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

function AddTitleForShell()
"    call append(0,"#!/bin/bash")
    call append(0,"# ")
    call append(1,"# *********************************************************")
    call append(2,"# * Author        : LEI Sen")
    call append(3,"# * Email         : sen.lei@outlook.com")
    call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"# * Filename      : ".expand("%:t"))
    call append(7,"# * Description   : ")
    call append(8,"# *********************************************************")
endfunction

function AddTitleForLatex()
    call append(0,"% ")
    call append(1,"% *********************************************************")
    call append(2,"% * Author        : LEI Sen")
    call append(3,"% * Email         : sen.lei@outlook.com")
    call append(4,"% * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"% * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"% * Filename      : ".expand("%:t"))
    call append(7,"% * Description   : ")
    call append(8,"% *********************************************************")
endfunction


set wildmenu
set ignorecase
set number
set visualbell
set ruler
set autoread
set autowrite
set autochdir
set nocp
set mouse=a

map 9 $
map <silent>  <C-A>  gg v G

filetype on
filetype plugin on

set foldmethod=marker


set cindent
set smartindent
set autoindent
filetype indent on
set softtabstop=4
set shiftwidth=4
set smarttab

set hlsearch
set incsearch

set noswapfile
set nobackup
set nowritebackup

nmap ;s :%s/\<<C-R>=expand("<cword>")<CR>\>/
nmap ;g :vimgrep <C-R>=expand("<cword>")<CR>

autocmd BufNewFile *.txt set ft=confluencewiki
autocmd BufEnter *.txt set ft=confluencewiki
