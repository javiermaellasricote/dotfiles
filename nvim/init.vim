set number

set so=999
nnoremap G Gzz
nnoremap j jzz
nnoremap k kzz
nnoremap gg ggzz

" vim-fugitive remaps
command GS 0G | 5
command GC vertical Git commit -v
command GP Git push
nnoremap g1 :diffget //2
nnoremap g9 :diffget //3

" Telescope
nnoremap T :Telescope find_files<CR>
nnoremap F :Telescope live_grep<CR>
nnoremap ff /<C-r><C-w><CR> :Telescope grep_string<CR>

" Substitute all with same name in file.
nnoremap S :%s/<C-r><C-w>//g<Left><Left>

" Code spell checking
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Activate markdown mode.
function MarkdownFunc()
  :Goyo
  :Limelight
  :MarkdownPreview
  :set spell
endfunction
command MdMode exec MarkdownFunc()

" Basic display config
set listchars=tab:¦.,trail:•
set list

set expandtab
set tabstop=2
set shiftwidth=2
set laststatus=3

call plug#begin('~/.config/nvim/plugged')

" Basic packages
Plug 'nvim-lua/plenary.nvim'
Plug 'preservim/nerdcommenter'
Plug 'neomake/neomake'

" Theme and appearance
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-signify'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Code checks
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Search and replace
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog' " Git branch viewer, maybe it can be removed
Plug 'ruanyl/vim-gh-line'

" Cursor movement
Plug 'christoomey/vim-tmux-navigator'

" ****
" Language specific packages
" ****

" Typesctript
Plug 'HerringtonDarkholme/yats.vim'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sago35/tinygo.vim'

" Terraform 
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

" Flutter
Plug 'dart-lang/dart-vim-plugin'

" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

"LaTeX support
Plug 'lervag/vimtex'

"Rust support
Plug 'rust-lang/rust.vim'

" Bazel support
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

call plug#end()

" Signify
set updatetime=100


" COLOR SCHEME
set termguicolors
colorscheme nord
let g:airline_theme='nord'

" COC CONFIG
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-rome',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-docker',
  \ 'coc-vetur',
  \ ]

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
tnoremap <Esc> <C-\><C-n>

" go-vim 
let g:go_def_mapping_enabled = 0
