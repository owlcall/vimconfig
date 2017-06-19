#!/usr/bin/env bash

ROOT=$( cd "$( dirname "$0" )" && pwd )

if [ ! -f ~/.vimrc ]; then
    echo "> .vimrc file not found"
	echo "> writing custom .vimrc as a symlink"
	ln -sf $ROOT/vimrc ~/.vimrc
else
	if [ ! -L ~/.vimrc ]; then
		echo "> .vimrc exists; backing up to ~/.vimrc_backup"
		mv ~/.vimrc ~/.vimrc_backup
	else
		SYMDIR="$(readlink ~/.vimrc)"
		echo "> .vimrc is a symlink; pointing to "$SYMDIR
	fi
	echo "> writing custom .vimrc as a symlink"
	ln -sf $ROOT/vimrc ~/.vimrc
fi

# Install Powerline fonts for vim status embellishment
./fonts/install.sh D2Coding
echo "> d2coding powerline font installed. Please change fonts in terminal"

# Ensure vim exists
if hash vim 2>/dev/null; then
	echo "> installing vim plugins from .vimrc..."
	# Check to see if we need to install vundle, and install it
	if [ ! -d ~/.vim/bundle ]; then mkdir -p ~/.vim/bundle;	fi
	if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
else
	echo >&2 "> error: vim is missing. install vim and re-run config";
	exit 1;
fi

# Install vim plugins
vim +PluginInstall +qall
# Clean vim plugins that aren't in use

