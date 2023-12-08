set number

set so=999
nnoremap G Gzz
nnoremap j jzz
nnoremap k kzz
nnoremap gg ggzz

" line numbers
set number
set relativenumber

" folding
set foldmethod=indent
set foldlevelstart=0

" vim-fugitive remaps
command GS sp | 0G | 5
command GC vertical Git commit -v
nnoremap g1 :diffget //2
nnoremap g9 :diffget //3

" Graphite remaps
function SyncRestackFunc()
	:! gt sync --no-interactive
	:! gt restack --no-interactive
endfunction
command GP !gt submit --no-interactive
command GL exec SyncRestackFunc()
command GJ !gt down
command GK !gt up

" Telescope
autocmd! FileType TelescopeResults setlocal nofoldenable
nnoremap T :Telescope find_files<CR>
nnoremap F :Telescope live_grep<CR>
nnoremap ff * :Telescope grep_string<CR>

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

" Vue commands
command VueSplit CocCommand volar.action.splitEditors

" Basic display config
set listchars=tab:¦.,trail:•
set list

set expandtab " This will transform tabs into spaces.
set tabstop=2
set shiftwidth=2
set laststatus=3

call plug#begin('~/.config/nvim/plugged')

" Basic packages
Plug 'nvim-lua/plenary.nvim'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'

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

" Sessions
Plug 'tpope/vim-obsession'

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

"Vue
Plug 'posva/vim-vue'

"Haskell
Plug 'MrcJkb/haskell-tools.nvim', { 'branch': '1.x.x' }

" AI
Plug 'David-Kunz/gen.nvim'

call plug#end()

" Signify
set updatetime=100


" COLOR SCHEME
set termguicolors
colorscheme nord
let g:airline_theme='nord'

" Autoformatting
autocmd BufWritePost *.ts !biome check --apply %
" autocmd BufWritePost *.sql exec :CocCommand sqlfluff.fix

" COC CONFIG
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
	\ 'coc-biome',
  \ 'coc-json',
  \ 'coc-docker',
  \ 'coc-rust-analyzer',
	\ 'coc-sqlfluff',
  \ '@yaegassy/coc-volar',
  \ '@yaegassy/coc-volar-tools',
  \ ]

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
tnoremap <Esc> <C-\><C-n>

" go-vim 
let g:go_def_mapping_enabled = 0
