" Formatting
set nu
syntax on
set tabstop=4
set shiftwidth=4
set expandtab

" Compiling rALT-C hotkey
" First runs clear, then runs compiler with current filename '%',
" then executes the program without the extension '%:r'
if &filetype ==# 'rust'
    nmap ¢ :! clear; cargo run --  
endif
if &filetype ==# 'c'
    nmap ¢ :! clear; gcc % && ./a.out
endif

" Vim Plug
" https://github.com/junegunn/vim-plug
" Run :PlugInstall to install
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.vimrc_coc "Config from https://github.com/neoclide/coc.nvim
call plug#end()

