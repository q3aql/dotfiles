let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
:set termguicolors
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set rnu
:set nu
:set rtp+=/home/q3aql/.config/nvim/tree.nvim/
:packadd onedark.vim
:colorscheme onedark

call plug#begin()
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
