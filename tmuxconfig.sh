#!/usr/bin/env bash

ROOT=$( cd "$( dirname "$0" )" && pwd )

# Setup tmux config file
echo "> configuring tmux..."
if [ ! -f ~/.tmux.conf ]; then
    echo "> tmux config \".tmux.conf\" file not found"
	echo "> writing custom .tmux.conf as a symlink"
	ln -sf $ROOT/configs/tmux/tmux.conf ~/.tmux.conf 
else
	if [ ! -L ~/.tmux.conf ]; then
		echo "> tmux config \".tmux.conf\" exists; backing up to ~/.tmux.conf"
		mv ~/.tmux.conf ~/.tmux.conf.backup
		rm ~/.tmux.conf
	else
		SYMDIR="$(readlink ~/.tmux.conf)"
		echo "> tmux config \".tmux.conf\" is a symlink; pointing to "$SYMDIR
	fi
	echo "> writing custom .tmux.conf as a symlink"
	ln -sf $ROOT/configs/tmux/tmux.conf ~/.tmux.conf
fi

# Install tmux theme
echo "> installing tmux theme..."
mkdir -p ~/.tmux/themes
ln -sf $ROOT/configs/tmux/cyan.tmuxtheme ~/.tmux/themes/

