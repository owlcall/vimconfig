#!/usr/bin/env bash
#

DIR=$( cd "$( dirname "$0" )" &&  pwd )
OP="ln -sf"
FORCE=false

while [[ $# -gt 0 ]]
do
	key="$1"
	case $key in
		-c|--copy)
			OP="cp -r"
			shift
		;;

		-l|--link)
			OP="ln -sf"
			shift
		;;

		-f|--force)
			FORCE=true
			shift
		;;

		*)
			shift
		;;
	esac
done

# Configure vim components, one by one:
# - create/replace ~/.vimrc file
# - configure themes/fonts
# - install vim plugins

# Backup old ~/.vimrc if it already exists
if [ -f ~/.vimrc ]  &&  [ ! -L ~/.vimrc ]; then
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

# Install plugins
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
fi

# Configure vim airline theme
$OP "$DIR/configs/vim/airline_bubblegum.vim" ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/bubblegum.vim

# Configure vim syntax coloring
for d in [ "syntax", "after/syntax" ]; do
	mkdir -p ~/.vim/$d
	for i in [ "$DIR/configs/vim/$d/*" ]; do
		if [ -f ~/.vim/$d/$i ]  &&  [ ! $FORCE ]; then
			echo "~/.vim/$d/$i already exists; use -f or --force to overwrite" 1>&2
			exit 1
		fi
		$OP "$DIR/configs/vim/$d/*" ~/.vim/$d/
	done
done
