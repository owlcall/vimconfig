set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"=========== Vundle plugin (must be first)
Plugin 'gmarik/Vundle.vim'

"=========== GIT plugins
Plugin 'tpope/vim-fugitive'				" Displays git branch in airline
Plugin 'airblade/vim-gitgutter'			" Displays git diff information in line gutters

"=========== Indexing/Tagging plugins
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'

"=========== Autocomplete plugins
"Plugin 'Valloric/YouCompleteMe'

"=========== Navigation plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-smooth-scroll'

"=========== General/Miscellaneous plugins
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lastsupertim/vimsuperdebug'

"=========== Display plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'octol/vim-cpp-enhanced-highlight'

"=========== Themes
Plugin 'w0ng/vim-hybrid'

call vundle#end()            " required
"filetype plugin indent on    " required


"=========================== Vim behavior settings
if has ('autocmd')
	"=== Autoreload .vimrc on save, add file-type-based indentation
	augroup vimrc			" Replace vim configuration upon save
		autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
		autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
	augroup END

	augroup RestoreCursor	" Restore cursor position when opening files"
		autocmd!
		autocmd BufReadPost * call setpos(".", getpos("'\""))|normal zz
	augroup END

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72, 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Fix python indentation defaults, no respect
	autocmd Filetype python setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
endif


"=========================== Positional settings
set splitbelow		" Use bottom split for a new horizontal split buffer
set splitright		" Use right split for a new vertical split buffer

"=========================== General settings
set exrc			" Load working directory .vimrc file
set secure
set antialias		" Enable antialiasing on Mac OS X
set encoding=utf-8	" Default utf-8 encoding
set history=1024	" Increase command history

set shortmess+=O                      " file-read message overwrites previous
set shortmess+=o                      " overwrite file-written messages

if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif

if exists('$SUDO_USER')
	set nobackup                        " don't create root-owned files
	set nowritebackup                   " don't create root-owned files
	set backupdir=/tmp	" Location of the backup directory set dir=/tmp		" Location of the swap file
else
	set backupdir=~/local/.vim/tmp/backup
	set backupdir+=~/.vim/tmp/backup    " keep backup files out of the way
	set backupdir+=.
	set directory=~/local/.vim/tmp/swap//
	set directory+=~/.vim/tmp/swap/    " keep swap files out of the way
	set directory+=.
endif

" Disabling arrow keys (forming habbits!)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
let mapleader = " "
nmap \ <Leader>

" Wildcard search ignore settings
set wildignore+=.git
set wildignore+=*~,*.swp,*.swo,*.tmp

"=========================== Editor formatting
set tabstop=4		" width of the TAB character
set softtabstop=4
set shiftwidth=4	" depth of single indentation level
set noexpandtab

"=========================== Editor display
syntax on			" Enable syntax highlighting across the board
set relativenumber
set number
set hlsearch		" Highlight search results
set cursorline		" Highlight cursor line
set laststatus=2	" Show statusbar all the time
set scrolloff=1		" Scroll offset of 1 line
set showmatch		" Show matching bracket

set list
set listchars=tab:>-     " > is shown at the beginning, - throughout

set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
if has('linebreak')
	let &showbreak='⤷ '                 " ARROW POINTING DOWNWARDS THEN CURVING RIGHTWARDS (U+2937, UTF-8: E2 A4 B7)
endif

" Show autocomplete options as visible menu when pressing tab on command line
set wildchar=<Tab> wildmenu wildmode=full

"=========================== Theme settings
set background=dark
colorscheme hybrid

" C++ Syntax Hilighting
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
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '[%s} '

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

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
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"=== Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"=========================== Quickfix Toggle
function! GetBufferList()
	redir =>buflist | silent! ls!| redir END| return buflist
endfunction

function! ToggleList(bufname, pfx)
	let buflist = GetBufferList()
	for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
		if bufwinnr(bufnum) != -1
			exec(a:pfx.'close')
			return
		endif
	endfor
	if a:pfx == 'l' && len(getloclist(0)) == 0
		echohl ErrorMsg
		echo "Location List is Empty."
		return
	endif
	let winnr = winnr()
	exec(a:pfx.'open')
	if winnr() != winnr
		wincmd p
	endif
endfunction



"=========================== YouCompleteMe plugin customization

"=== Autocomplete config file (for c-family languages)
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"=========================== Tagging configuration
set tags=./tags,tags;$HOME					" Seach in current directory, current file's directory, or up dir until $HOME
set statusline+=%{gutentags#statusline()}	" Display notice when gutentags is generating tags

"=========================== Scroll Controls

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 3)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 3)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 3)<CR>

"=========================== Keyboard Bindings - Normal Mode
"=== Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"=== Navigation bindings
nnoremap <Leader>q :bd\|bd #<CR>		" Destroy buffer
nnoremap <Leader>f :cn<CR>:cf<CR>		" Open file/line for next error in quickfix window
nnoremap <Leader><S-Tab> : bp<CR>		" Previous buffer
nnoremap <Leader><Tab> : bn<CR>			" Next buffer
nnoremap <C-s> <Esc>:w<CR>					" Save buffer

"=== Display toggles
"nnoremap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <C-n>	   :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>

"=== Editor bindings
nnoremap <space> za|					" Enable folding with the spacebar
nnoremap <Leader>w :w !diff % -<CR>|	" Show differences before writing to file

"=== Developer/build bindings
nnoremap <Leader>c :Dispatch cd build && rm -rf * && cmake ..<CR>
nnoremap <Leader>b :Dispatch pwd && make -C build<CR>
nnoremap <Leader>r :Dispatch ./bin/alpha<CR>

"=========================== Keyboard Bindings - Insert Mode
"=== Editor bindings
inoremap <S-Tab> <C-d>

