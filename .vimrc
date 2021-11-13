let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
:set termguicolors
:set formatoptions=tcqrn1
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set expandtab
:set noshiftround
":set rtp+=/home/q3aql/.config/nvim/tree.nvim/
:set rnu
:set nu
:packadd onedark.vim
:colorscheme onedark

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Fixes common backspace problems
set backspace=indent,eol,start

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'  " JavaScript Support
Plug 'leafgarland/typescript-vim' "TypeScript Support
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'nikvdp/neomux'
Plug 'mattn/emmet-vim'
Plug 'vim-autoformat/vim-autoformat'
call plug#end()

"let g:airline_powerline_fonts = 1
let g:netrw_browse_split = 3
"let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:coc_global_extensions = [ 'coc-emmet' ]
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<C-y>'
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"require'nvim-tree'.setup()
