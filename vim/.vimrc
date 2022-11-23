set nocompatible
syntax on

set number
set relativenumber

set cursorline
set laststatus=2
set noerrorbells
set background=light

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
"set smartindent
filetype plugin indent on

noremap ; :
map <Up> gk
map <Down> gj
set backspace=2

set autoread
set hidden
set history=500

" Delete trailing white space on save
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
