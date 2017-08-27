#!/usr/bin/env bash

ROOT=$( cd "$( dirname "$0" )" && pwd )

# Setup vimrc file
if [ ! -f ~/.vimrc ]; then
    echo "> .vimrc file not found"
	echo "> writing custom .vimrc as a symlink"
	ln -sf $ROOT/vim/vimrc ~/.vimrc
else
	if [ ! -L ~/.vimrc ]; then
		echo "> .vimrc exists; backing up to ~/.vimrc_backup"
		mv ~/.vimrc ~/.vimrc_backup
		rm ~/.vimrc
	else
		SYMDIR="$(readlink ~/.vimrc)"
		echo "> .vimrc is a symlink; pointing to "$SYMDIR
	fi
	echo "> writing custom .vimrc as a symlink"
	ln -sf $ROOT/vim/vimrc ~/.vimrc
fi

# Setup tmux config file
if [ ! -f ~/.tmux.conf ]; then
    echo "> .tmux.conf file not found"
	echo "> writing custom .tmux.conf as a symlink"
	ln -sf $ROOT/tmux/tmux.conf ~/.tmux.conf 
else
	if [ ! -L ~/.tmux.conf ]; then
		echo "> .tmux.conf exists; backing up to ~/.tmux.conf"
		mv ~/.tmux.conf ~/.tmux.conf.backup
		rm ~/.tmux.conf
	else
		SYMDIR="$(readlink ~/.tmux.conf)"
		echo "> .tmux.conf is a symlink; pointing to "$SYMDIR
	fi
	echo "> writing custom .tmux.conf as a symlink"
	ln -sf $ROOT/tmux/tmux.conf ~/.tmux.conf
fi

# Ensure ctags exists
if ! hash ctags 2>/dev/null; then
	echo "> ctags is not installed; remember to install ctags"
fi

# Install Powerline fonts for vim status embellishment
./powerline/fonts/install.sh D2Coding
echo "> d2coding powerline font installed. Please change fonts in terminal"

# Ensure vim exists
if hash vim 2>/dev/null; then
	echo "> installing vim plugins from .vimrc..."
	# Check to see if we need to install vundle, and install it
	if [ ! -d ~/.vim/bundle ]; then mkdir -p ~/.vim/bundle;	fi
	if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
	fi
else
	echo >&2 "> error: vim is missing. install vim and re-run config";
	exit 1;
fi

# Install vim theme
echo "> installing vim theme..."
mkdir -p ~/.vim/colors
ln -sf $ROOT/vim/apprentice.vim ~/.vim/colors/apprentice.vim

# Install vim templates
echo "> installing vim templates..."
ln -sf $ROOT/vim/templates ~/.vim/templates

# Installing vim syntax files
echo "> installing vim syntax files..."
mkdir -p ~/.vim/syntax
mkdir -p ~/.vim/after/syntax
ln -sf $ROOT/vim/syntax/* ~/.vim/syntax/
ln -sf $ROOT/vim/after/syntax/* ~/.vim/after/syntax/

# Install airline theme (green normal, red insert, purple replace, blue visual)
echo "> installing airline theme..."
cp vim/airline_bubblegum.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/bubblegum.vim

#echo "> installing syntax theme..."
#ln -sf $ROOT/vim/theme_hybrid.vim ~/.vim/bundle/vim-hybrid/colors/hybrid.vim

# Install tmux theme
echo "> installing tmux theme..."
mkdir -p ~/.tmux/themes
cp tmux/cyan.tmuxtheme ~/.tmux/themes/

# Install bash shortcuts
echo "> installing bash modifications"
function update {
	grep -q "$1" ~/.bashrc || echo "$1" >> ~/.bashrc
}
update PATH='$PATH:$ROOT/shell/bin/'
update "alias tmux='$(which tmux) -2'"

source ~/.bashrc

