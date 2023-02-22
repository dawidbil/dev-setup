" Vim
set number
set relativenumber
set scrolloff=8
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set encoding=utf8
set nocompatible
set laststatus=2
set background=dark

" Mappings
nnoremap <SPACE> <Nop>
let mapleader=" "
inoremap jk <Esc>
nnoremap ' `
nnoremap ` '
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" Plugins
call plug#begin("~/.local/share/nvim/plugged")
" Git
Plug 'tpope/vim-fugitive'
" Surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" For indentation visibility
Plug 'yggdroot/indentline'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Automatically open and close braces
Plug 'jiangmiao/auto-pairs'
" Easy commenting
Plug 'preservim/nerdcommenter'
" Tree with files
Plug 'scrooloose/nerdtree'
" See what was yanked
Plug 'machakann/vim-highlightedyank'
" Best theme
Plug 'morhetz/gruvbox'
" Switch between tmux and nvim panes
Plug 'christoomey/vim-tmux-navigator'
" Fuzzy matching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Linting etc.
Plug 'dense-analysis/ale'
call plug#end()

" Plugins settings
let g:indentLine_char = '▏'
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:gruvbox_italic = 1

" Start NERDTree when NeoVim is started witout file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Theme
autocmd vimenter * ++nested colorscheme gruvbox
