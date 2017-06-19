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
	augroup vimrc     " Source vim configuration upon save
		autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
		autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
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
set exrc		" Load working directory .vimrc file
set secure
set antialias	" Enable antialiasing on Mac OS X
set mouse=a		" Activate mouse


"=========================== Enable folding
set foldmethod=indent
set foldlevel=99


"=========================== Editor formatting
set tabstop=4		" width of the TAB character
set softtabstop=4
set shiftwidth=4	" dept of single indentation level


"=========================== Editor display
set number
"set relativenumber
syntax on	" Enable syntax highlighting across the board


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
"=== Enable the tabline extension which shows all buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
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


"=========================== NERDtree plugin customization
let NERDTreeShowHidden=1

"=== NERDtree open by default
autocmd VimEnter * NERDTree

"=== Quit vim if NERDtree is the last panel standing
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"=========================== YouCompleteMe plugin customization
"=== Autocomplete config file (for c-family languages)
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' 
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


"=========================== Tagging configuration
set tags=./tags,tags;$HOME					" Seach in current directory, current file's directory, or up dir until $HOME
set statusline+=%{gutentags#statusline()}	" Display notice when gutentags is generating tags


"=========================== Keyboard Bindings
"=== Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"=== Panel toggles
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <C-n>	   :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>

"=== Editor bindings
nnoremap <space> za|					" Enable folding with the spacebar
nnoremap <Leader>w :w !diff % -<CR>|	" Show differences before writing to file

"=== Developer/build bindings
nnoremap <Leader>c :Dispatch cd build && rm -rf * && cmake ..<CR>
nnoremap <Leader>b :Dispatch make -C build<CR>
nnoremap <Leader>r :Dispatch ./bin/alpha<CR>

