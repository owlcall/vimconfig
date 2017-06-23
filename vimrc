set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')

"=========== Vundle plugin (must be first)
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'

"=========== GIT plugins
Plugin 'tpope/vim-fugitive'				" Displays git branch in airline
Plugin 'airblade/vim-gitgutter'			" Displays git diff information in line gutters
Plugin 'Xuyuanp/nerdtree-git-plugin'	" Displays git status via nerdtree icons

"=========== Indexing/Tagging plugins
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'

"=========== Autocomplete plugins
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'vim-scripts/indentpython.vim'

"=========== Navigation plugins
Plugin 'scrooloose/nerdtree'
Plugin 'benmills/vimux'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-smooth-scroll'

"=========== General/Miscellaneous plugins
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/nerdcommenter'

"=========== Display plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'octol/vim-cpp-enhanced-highlight'

"=========== Themes
"Plugin 'flazz/vim-colorschemes'
Plugin 'w0ng/vim-hybrid'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"=========================== Vim behavior settings
"=== Autoreload .vimrc on save, add file-type-based indentation
if has ('autocmd') " Remain compatible with earlier versions
	augroup vimrc			" Source vim configuration upon save
		autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
		autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
	augroup END

	augroup RestoreCursor	" Restore cursor position when opening files"
		autocmd!
		autocmd BufReadPost * call setpos(".", getpos("'\""))|normal zz
	augroup END

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent
	" indenting.
	filetype plugin indent on
endif " has autocmd


"=========================== Positional settings
set splitbelow		" Use bottom split for a new horizontal split buffer
set splitright		" Use right split for a new vertical split buffer

"=========================== General settings
set exrc			" Load working directory .vimrc file
set secure
set antialias		" Enable antialiasing on Mac OS X
"set mouse=a			" Activate mouse
set encoding=utf-8	" Default utf-8 encoding
set history=1024	" Increase command history
set backupdir=/tmp	" Location of the backup directory
set dir=/tmp		" Location of the swap file

" Disabling arrow keys (forming habbits!)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Wildcard search ignore settings
set wildignore+=.git
set wildignore+=*~,*.swp,*.swo,*.tmp
"set ruler

"=========================== Enable folding
set foldmethod=indent
set foldlevel=99

"=========================== Editor formatting
set tabstop=4		" width of the TAB character
set softtabstop=4
set shiftwidth=4	" dept of single indentation level

"=========================== Editor display
syntax on			" Enable syntax highlighting across the board
"set relativenumber
set number
set hlsearch		" Highlight search results
set cursorline		" Highlight cursor line
"set cursorcolumn	" Highlight cursor column
set laststatus=2	" Show statusbar all the time
set scrolloff=1		" Scroll offset of 1 line
set showmatch		" Show matching bracket
set list lcs=tab:\|\ 	" Display indentation guides

" Show autocomplete options as visible menu when pressing tab on command line
set wildchar=<Tab> wildmenu wildmode=full

"=========================== Theme settings
set background=dark
colorscheme hybrid

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1


"=========================== Fixes
"=== Fix the backspace key from getting stuck on one line
set backspace=indent,eol,start

"=== Fix key bindings if running within tmux on mac
if &term =~ '^screen'
" tmux will send xterm-style keys when its xterm-keys option is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif


"=========================== Airline plugin customization
let g:airline_theme = "bubblegum"

"=== Enable the tabline extension which shows all buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

"=== Custom fonts for airline status bar
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"=== Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

"=== Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"=========================== NERDtree plugin customization
let NERDTreeShowHidden=1

"=== NERDtree open by default, highlight current file,  and focus on buffer
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | NERDTreeFind | wincmd p | endif


"function! NumBuffers()
	"return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
"endfunction

"function! IsInNERDTree()
	"return exists("b:NERDTree") && b:NERDTree.isTabTree()
"endfunction

"function! ToggleTree()
	"if(!exists('t:NERDTreeBufName'))
		""echo "No nerd tree"
		"return
	"endif

	"" Check if NERDTree is currently open
	"if(bufwinnr(t:NERDTreeBufName) == 1)
	   "return
	"endif

	"if(bufwinnr(t:NERDTreeBufName) == -1)
		":NERDTree
		":wincmd p
		":NERDTreeFind
		":wincmd p
	"endif
"endfunction

""autocmd BufEnter * if(!IsInNERDTree() && winnr() == 1) | call ToggleTree() | elseif(IsInNERDTree() && winnr() == 1) | bd | endif

"=========================== YouCompleteMe plugin customization
"=== Autocomplete config file (for c-family languages)
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"=========================== Tagging configuration
set tags=./tags,tags;$HOME					" Seach in current directory, current file's directory, or up dir until $HOME
set statusline+=%{gutentags#statusline()}	" Display notice when gutentags is generating tags

"=========================== Scroll Controls

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

"=========================== Keyboard Bindings - Normal Mode
"=== Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"=== Display toggles
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <C-n>	   :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

"=== Editor bindings
"nnoremap <S-Tab> <<
"nnoremap <Tab> >>
nnoremap <space> za|					" Enable folding with the spacebar
nnoremap <Leader>w :w !diff % -<CR>|	" Show differences before writing to file

"=== Developer/build bindings
nnoremap <Leader>c :Dispatch cd build && rm -rf * && cmake ..<CR>
nnoremap <Leader>b :Dispatch pwd && make -C build<CR>
nnoremap <Leader>r :Dispatch ./bin/alpha<CR>

"=========================== Keyboard Bindings - Insert Mode
"=== Editor bindings
inoremap <S-Tab> <C-d>


nnoremap <Leader><Tab> : bn<CR>
