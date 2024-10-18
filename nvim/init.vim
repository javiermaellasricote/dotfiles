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
command L sp | 0G | 5
command K vertical Git commit -v
command P !git push
nnoremap g1 :diffget //2
nnoremap g9 :diffget //3

" Telescope
autocmd! FileType TelescopeResults setlocal nofoldenable
nnoremap Y :Telescope find_files<CR>
nnoremap U :Telescope live_grep<CR>
nnoremap ff * :Telescope grep_string<CR>

" Substitute all with same name in file.
nnoremap S :%s/<C-r><C-w>//g<Left><Left>

" Code spell checking
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Basic display config
set listchars=tab:¦.,trail:•
set list

set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

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

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sago35/tinygo.vim'
Plug 'joerdav/templ.vim'

" Terraform 
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

" Markdown
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" LaTeX support
Plug 'lervag/vimtex'

" Rust support
Plug 'rust-lang/rust.vim'

" Vue
Plug 'posva/vim-vue'

" Haskell
Plug 'MrcJkb/haskell-tools.nvim', { 'branch': '1.x.x' }

call plug#end()

" Signify
set updatetime=100


" COLOR SCHEME
set termguicolors
colorscheme nord
let g:airline_theme='nord'

" Autoformatting
autocmd BufWritePost *.ts !biome check --apply %
autocmd BufWritePost *.templ !templ fmt %
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
