set nocompatible      " Choose no compatibility with legacy vi
set laststatus=2      " Enable status line

syntax on             " Enable syntax highlighting
set mouse=i           " Enable mouse support in console (insert mode)
colorscheme escuro    " Load colorscheme
if !has("gui_running") && $TERM =~# ".*-256color"
  set t_Co=256      " Force 256 colors terminal
endif

"" Whitespace
set tabstop=2         " A TAB = 2 spaces
set shiftwidth=2      " Indent/Unindent of 2 spaces
set softtabstop=2     " Backspace unindents
set backspace=indent,eol,start  " Backspace through everything in insert mode
set expandtab         " Expand tabs to spaces
set autoindent        " Copies previous line's indentation
set nowrap            " Don't wrap lines
let &listchars="tab:\u2192 ,trail:\u00b7,extends:\u25b8,precedes:\u25c2"
set list              " Display unwanted chars

"" Backup files
set nobackup          " No backup file
set noswapfile        " No swap file

"" Searching
set hlsearch          " highlight matches
set incsearch         " incremental searching
set ignorecase        " searches are case insensitive...
set smartcase         " ... unless they contain at least one capital letter

"" File explorer (netrw)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"" augroup ProjectDrawer
""   autocmd!
""   autocmd VimEnter * :Vexplore
"" augroup END
