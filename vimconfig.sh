#!/usr/bin/env bash
#
# vimconfig.sh 
# Copyright (c) 2018 owl
#

DIR=$( cd "$( dirname "$0" )" && pwd )
OP=cp
FORCE=false

while [[ $# -gt 0 ]]
do
	key="$1"
	case $key in
		-c|--copy)
			OP="cp -r"
			shift # past argument
		;;

		-l|--link)
			OP="ln -sf"
			shift # past argument
		;;

		-f|--force)
			FORCE=true
			shift # past argument
		;;

		*)    # unknown option
		shift # past argument
		;;
	esac
done

# Configure vim components, one by one:
# - create/replace ~/.vimrc file
# - configure themes/fonts
# - install vim plugins

# Backup old ~/.vimrc if it already exists
if [ -f ~/.vimrc && ! -L ~/.vimrc ]; then
	if [ ! $FORCE ]; then
		echo "~/.vimrc_backup already exists; use -f or --force to overwrite" 1>&2
		exit 1
	fi

	mv ~/.vimrc ~/.vimrc_backup
	rm ~/.vimrc
fi

$OP "$DIR/configs/vim/vimrc" ~/.vimrc


# Configure vim colors
mkdir -p ~/.vim/colors
$OP "$DIR/configs/vim/apprentice.vim" ~/.vim/colors/apprentice.vim

# Configure vim templates
mkdir -p ~/.vim/templates
$OP "$DIR/configs/vim/templates/skeleton.*" ~/.vim/templates/

