
" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
"
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Atom One Dark / Light theme
Plug 'rakr/vim-one'

" Integrate fzf with Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Make simple quoting & parenthesizing
Plug 'tpope/vim-surround'

" Enhance netrw and make it awesome
Plug 'tpope/vim-vinegar'

" Toggle comments in various ways
Plug 'tpope/vim-commentary'

" Another tpope plugin because why not
Plug 'tpope/vim-unimpaired'

" A bunch of useful language related snippets (ultisnips is the engine).
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' 

" Integrate hotkeys to navigate between tmux panes & vim splits
Plug 'christoomey/vim-tmux-navigator'

" Vim plugin for the tmux.conf
Plug 'tmux-plugins/vim-tmux'

" Collection of language packs
Plug 'sheerun/vim-polyglot'

" Autocomplete engine
" Plug 'codota/tabnine-vim'

" Query Hoogle from Vim
" Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" Syntax highlighting for Markdown 
" Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------
" Enable true colors if the terminal supports it
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

" Enable syntax highlighting
syntax on

" Setting the color scheme
 colorscheme one
 set background=dark
" set background HAS to be called after the colorscheme for it to work

" -----------------------------------------------------------------------------
" Basic settings
" -----------------------------------------------------------------------------

set autoread
set backspace=eol,start,indent
set nocompatible
set smartindent
set smartcase
set hlsearch
set incsearch
set cmdheight=1
set lazyredraw
set expandtab
set splitbelow
set shiftwidth=2
set softtabstop=2
set tabstop=2
set showcmd
set showmatch
set mat=2
set matchpairs+=<:> " Use % to jump between pairs
set laststatus=2
set noerrorbells
set visualbell t_vb=
set ruler
set number
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=80
set wildmenu
set wildmode=list,full
set wrap

highlight ColorColumn guibg=lightgrey

let mapleader = " "
"set tm=2000
"set g:netrw_browse_split=2
let g:netrw_winsize=25

" Treat visual lines as how they should be
noremap j gj 
noremap k gk
noremap <Down> gj
noremap <Up> gk 

" Switch between splits in a better way
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Cycle through splits
nnoremap <S-Tab> <C-w>w

" Extra goodness right here
nnoremap <Leader>pv :wincmd v<bar> :E <bar> :vertical resize 30<CR>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn
 
" Better way to create splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> hh <C-w>s

" Close every split in view except the current one
nnoremap <Leader>o <C-w>o

" Easy split resizing
nnoremap <Leader>+ :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>

" Return to last edit position when opening files
augroup last_edit
  autocmd!
    autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" Clear search highlights
map <Leader>c :let @/=''<CR>

" No more escape in insert mode
imap kj <Esc>

" Auto-resize splits when Vim gets resized
autocmd VimResized * wincmd =

" -----------------------------------------------------------------------------
" Plugin-related settings 
" -----------------------------------------------------------------------------

" fzf.vim
" -----------------------------------------------------------------------------
" Customize fzf colors to match the color scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" vim-tmux-navigator
" -----------------------------------------------------------------------------
" Custom key mappings
" let g:tmux_navigator_no_mappings = 1
"
" nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<c

" vim-unimpaired
" -----------------------------------------------------------------------------
" Move single lines
  nmap <C-n> [e
  nmap <C-m> ]e
" Move multiple lines selected
  vmap <C-n> [egv
  vmap <C-m> ]egv
