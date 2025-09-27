" Dan R 2025 ~/.vimrc


" ==============================
" CONFIGURATIONS
" ==============================

" Formatting
set nu
syntax on
set tabstop=4
set shiftwidth=4
set expandtab

" Dont copy single characters to register
nnoremap x "_x


" ==============================
" BINDINGS
" ==============================

" 'ALT-GR + c' to compile
" 'ALT-GR + x' to compile and execute
:function! CompileWithMakefile(compiler, makeRun, gccRun)
: if filereadable("Makefile")
:   execute "! clear; make " . a:makeRun
: else
:   execute "! clear; " . a:compiler . " % " . a:gccRun
: endif
:endfunction

if &filetype ==# 'c'
    nmap ¢ : call CompileWithMakefile("gcc", "", "")<CR>
    nmap » : call CompileWithMakefile("gcc", "run", "&& ./a.out")<CR>
elseif &filetype ==# 'cpp'
    nmap ¢ : call CompileWithMakefile("g++", "", "")<CR>
    nmap » : call CompileWithMakefile("g++", "run", "&& ./a.out")<CR>
elseif &filetype ==# 'asm'
    nmap ¢ : call CompileWithMakefile("nasm -o a.out", "", "")<CR>
    nmap » : call CompileWithMakefile("nasm -o a.out", "run", "&& ./a.out")<CR>
elseif &filetype ==# 'rust'
    nmap ¢ :! clear; cargo build --<CR>
    nmap » :! clear; cargo run --<CR>
elseif &filetype ==# 'sh'
    nmap ¢ :! clear; chmod 755 %<CR>
    nmap » :! clear; ./%<CR>
endif

" 'ALT-GR + t' to create terminal as the last tab
:function! NewTerminal()
: tab ter
: tabm $
:endfunction
nmap ŧ : call NewTerminal()<CR>

" 'ALT-GR + t' when already on terminal to shift to last tab
tnoremap ŧ <C-W>:tabm $<CR>

" 'CTRL + gt' next tab while in terminal mode (otherwise CTRL is not needed)
" 'CTRL + gT' prev tab while in terminal mode
tnoremap <C-g>t <C-W>:tabn<CR>
tnoremap <C-g>T <C-W>:tabp<CR>


" ==============================
" COMMANDS
" ==============================

" Shortcut for opening NERDTree
command Nt NERDTree

" Get wordcount
command Wordcount :set statusline+=%{wordcount().words}\ words


" ==============================
" MACROS
" ==============================

" Insert a comment at the end of a line of assembly
" (Adds 50 spaces at the end, goes to column 29, deletes all after that,
"  adds a '; ' and ends in insert mode.)
if &filetype ==# "asm"
    let @i = '50A 29|DA; '
endif


" ==============================
" PLUGINS
" ==============================
" Using VIM Plug
" https://github.com/junegunn/vim-plug
" Run :PlugInstall to install
call plug#begin()

" Vim-sensible is for sensible defaults
Plug 'tpope/vim-sensible'

" CoC is for IDE-like facilities
" Config from https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.vimrc_coc 

" NERDTree is for navigating directories
Plug 'preservim/nerdtree'

call plug#end()

