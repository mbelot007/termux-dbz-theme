" ==========================================
" Enhanced Vim Configuration for Termux
" With Catppuccin Frappe Theme & Plugins
" Works for both Vim and Neovim
" ==========================================

" Plugins (vim-plug)
" ==========================================
call plug#begin('~/.vim/plugged')

" Start screen
Plug 'mhinz/vim-startify'             " Start screen with recent files

" Essential plugins
Plug 'tpope/vim-commentary'           " Easy commenting with gc
Plug 'tpope/vim-surround'             " Surround text with quotes/brackets
Plug 'tpope/vim-repeat'               " Better repeat with .
Plug 'tpope/vim-fugitive'             " Git integration
Plug 'jiangmiao/auto-pairs'           " Auto-close brackets/quotes
Plug 'sheerun/vim-polyglot'           " Language pack

" File navigation - use system fzf (already installed via pkg)
set rtp+=/data/data/com.termux/files/usr/share/fzf
Plug 'junegunn/fzf.vim'               " FZF integration

" Catppuccin theme (official)
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Status line (lightweight)
Plug 'itchyny/lightline.vim'          " Status line

" Git signs in gutter
Plug 'airblade/vim-gitgutter'         " Show git changes

call plug#end()

" Basic Settings
" ==========================================
set nocompatible              " Use Vim settings, not Vi
filetype plugin indent on     " Enable file type detection
syntax on                     " Enable syntax highlighting

" Display Settings
" ==========================================
set number                    " Show line numbers
set relativenumber            " Relative line numbers
set ruler                     " Show cursor position
set showcmd                   " Show command in bottom bar
set showmode                  " Show current mode
set showmatch                 " Highlight matching brackets
set cursorline               " Highlight current line
set laststatus=2             " Always show status line
set wildmenu                 " Visual autocomplete for command menu
set wildmode=longest:full,full

" Color and Theme
" ==========================================
set termguicolors            " Enable true color support
set background=dark

" Load Catppuccin theme (only if installed)
silent! colorscheme catppuccin_frappe

" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'catppuccin',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Search Settings
" ==========================================
set incsearch                " Search as you type
set hlsearch                 " Highlight search results
set ignorecase               " Case insensitive search
set smartcase                " Unless uppercase is used

" Indentation
" ==========================================
set autoindent               " Auto-indent new lines
set smartindent              " Smart auto-indenting
set expandtab                " Use spaces instead of tabs
set tabstop=2                " Tab = 2 spaces
set shiftwidth=2             " Indent = 2 spaces
set softtabstop=2            " Backspace removes 2 spaces

" Text Behavior
" ==========================================
set wrap                     " Wrap long lines
set linebreak                " Break lines at word boundaries
set scrolloff=5              " Keep 5 lines visible when scrolling
set backspace=indent,eol,start " Sensible backspace

" Performance
" ==========================================
set lazyredraw               " Don't redraw during macros
set ttyfast                  " Faster terminal connection

" Backup and Undo
" ==========================================
set nobackup                 " No backup files
set noswapfile               " No swap files
set undofile                 " Persistent undo
set undodir=~/.vim/undo      " Undo directory
silent !mkdir -p ~/.vim/undo

" Key Mappings
" ==========================================
let mapleader = " "          " Space as leader key

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Clear search highlighting
nnoremap <leader>/ :noh<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Better indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" Plugin-specific mappings
" FZF shortcuts
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>h :History<CR>

" Git (fugitive) shortcuts
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>

" Plugin Settings
" ==========================================
" FZF settings
let g:fzf_layout = { 'down': '40%' }
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" GitGutter settings
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~-'

" Auto-pairs settings
let g:AutoPairsShortcutToggle = '<leader>p'

" Startify Configuration (Pikachu Theme)
" ==========================================
let g:startify_custom_header = startify#pad([
      \ '',
      \ '       \`;-.          ___,',
      \ '         `.\`\_....\_/`.-"`',
      \ '           \        /      ,',
      \ '           /()   () \    .'' `-._',
      \ '          |)  .    ()\  /   _.''',
      \ '          \  -''-     ,; ''. <',
      \ '           ;.__     ,;|   > \',
      \ '          / ,    / ,  |.-''.-''',
      \ '         (_/    (_/ ,;|.<`',
      \ '           \    ,     ;-`',
      \ '            >   \    /',
      \ '           (_,-''`> .''',
      \ '                 (_,''',
      \ '',
      \ '      ━━━━━━━━━━━━━━━━━━━━━━━━',
      \ '       "Gotta code ''em all!"',
      \ '      ━━━━━━━━━━━━━━━━━━━━━━━━',
      \ '',
      \ ])

let g:startify_custom_footer = startify#pad([
      \ '',
      \ '    ⚡ Powered by Vim ' . (v:version / 100) . '.' . (v:version % 100) . ' ⚡',
      \ ])

let g:startify_enable_special = 0

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   📂 Recent Files']            },
      \ { 'type': 'dir',       'header': ['   📁 Recent in '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   💾 Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   🔖 Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   ⚡ Commands']       },
      \ ]

let g:startify_bookmarks = [
      \ { 'z': '~/.zshrc' },
      \ { 'v': '~/.vimrc' },
      \ { 'n': '~/.config/nvim/init.lua' },
      \ ]

let g:startify_commands = [
      \ { 'u': ['Update Plugins', 'PlugUpdate'] },
      \ { 'c': ['Clean Plugins', 'PlugClean'] },
      \ ]

let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 3
let g:startify_relative_path = 1
let g:startify_files_number = 8

" File Type Settings
" ==========================================
autocmd FileType python setlocal ts=4 sw=4 sts=4
autocmd FileType go setlocal ts=4 sw=4 sts=4 noexpandtab
autocmd FileType javascript,typescript setlocal ts=2 sw=2 sts=2
autocmd FileType html,css setlocal ts=2 sw=2 sts=2
autocmd FileType markdown setlocal wrap spell

" Note: Status line is handled by lightline plugin
" Colors handled by official Catppuccin plugin

" Welcome Message
" ==========================================
autocmd VimEnter * if !argc() | echo "Enhanced Vim with Plugins & Catppuccin Frappe 🎨" | endif
