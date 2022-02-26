call plug#begin(stdpath('data') . '/plugged')
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
call plug#end()

filetype plugin on

set omnifunc=syntaxcomplete#Complete
set mouse=a
"set clipboard=unnamedplus
set number
set relativenumber
set cursorline
set colorcolumn=80
set nowrap
set tabstop=4
set shiftwidth=4

inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
map Y y$
map Q gq<space>
map S :%s//g<left><left>
map ,<space> :nohlsearch<CR>
map <F2> :source ~/.config/nvim/init.vim<CR>
map <F3> :!chmod +x % && ./%<CR>
map <M-c> :ColorToggle<CR>
map <Tab> :Buffers<CR>
map <c-f> :Files<CR>
map <c-o> :Files ~<CR>

let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

