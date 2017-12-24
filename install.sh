#!/usr/bin/env bash

ROOT=$( cd "$( dirname "$0" )" && pwd )

# Setup vimrc file
if [ ! -f ~/.vimrc ]; then
    echo "> .vimrc file not found"
	echo "> writing custom .vimrc as a symlink"
	ln -sf $ROOT/configs/vim/vimrc ~/.vimrc
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
	ln -sf $ROOT/configs/vim/vimrc ~/.vimrc
fi

# Setup tmux config file
if [ ! -f ~/.tmux.conf ]; then
    echo "> .tmux.conf file not found"
	echo "> writing custom .tmux.conf as a symlink"
	ln -sf $ROOT/configs/tmux/tmux.conf ~/.tmux.conf 
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
	ln -sf $ROOT/configs/tmux/tmux.conf ~/.tmux.conf
fi

# Ensure ctags exists
if ! hash ctags 2>/dev/null; then
	>&2 echo "> ctags is not installed; remember to install ctags"
else
	echo "> ctags is installed"
fi

# Install Powerline fonts for vim status embellishment
./shell/configs/powerline/fonts/install.sh D2Coding
echo "> cousine powerline font installed. Please change fonts in terminal"

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
ln -sf $ROOT/configs/vim/apprentice.vim ~/.vim/colors/apprentice.vim

# Install vim templates
echo "> installing vim templates..."
if [ -L ~/.tmux.conf ]; then
	SYMDIR="$(readlink ~/.vim/templates)"
	if [ "$SYMDIR" == "$ROOT/configs/vim/templates" ]; then
		echo "> vim templates are already configured correctly"
	else
		mv ~/.vim/templates ~/.vim/templates.backup
		ln -sf $ROOT/configs/vim/templates ~/.vim/templates
		echo "> backed up vim templates into ~/.vim/backup_templates"
		echo "> configured templates symlink"
	fi
fi

# Installing vim syntax files
echo "> installing vim syntax files..."
mkdir -p ~/.vim/syntax
mkdir -p ~/.vim/after/syntax
ln -sf $ROOT/configs/vim/syntax/* ~/.vim/syntax/
ln -sf $ROOT/configs/vim/after/syntax/* ~/.vim/after/syntax/

# Install airline theme (green normal, red insert, purple replace, blue visual)
echo "> installing airline theme..."
ln -sf $ROOT/configs/vim/airline_bubblegum.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/bubblegum.vim

# Install tmux theme
echo "> installing tmux theme..."
mkdir -p ~/.tmux/themes
ln -sf $ROOT/configs/tmux/cyan.tmuxtheme ~/.tmux/themes/

# Install bash shortcuts
echo "> installing bash modifications"
function update {
	grep -q "$1" ~/.bashrc || echo "$1" >> ~/.bashrc
}
update PATH='$PATH'":$ROOT/shell/bin/"
update "export CLICOLOR=1"
update "export LSCOLORS=ExFxBxDxCxegedabagacad"
update "alias gs='git status'"
update "alias tmux='$(which tmux) -2'"
update "alias ls='ls -lAhG'"

# Update git settings
echo "> installing git modifications"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global difftool.prompt false
git config --global core.editor vim
git config --global color.ui true
git config --global alias.dt difftool

# Configure git diff colors
git config --global color.diff.meta "cyan bold"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.old "red"
git config --global color.diff.new "green"

# Configure git status colors
git config --global color.status.added "green"
git config --global color.status.changed "red"
git config --global color.status.untracked "yellow"

echo "> current name: "`eval git config --global user.name`
read -p '> enter git name (leave blank to skip): ' git_name
if [[ ! -z $git_name ]]; then
	echo 'setting name "'$git_name'"'
	git config --global user.name "$git_name"
fi

echo "> current email: "`eval git config --global user.email`
read -p '> enter git email (leave blank to skip): ' git_email
if [[ ! -z $git_email ]]; then
	echo 'setting email "'$git_email'"'
	git config --global user.email "$git_email"
fi

source ~/.bashrc

