#!/usr/bin/env bash
#

DIR=$( cd "$( dirname "$0" )" && pwd )
OP="ln -sf"
LINK=true
FORCE=false

while [[ $# -gt 0 ]]
do
	key="$1"
	case $key in
		# Create symbolic links to current checkout (default)
		-l|--link)
			OP="ln -sf"
			LINK=true
			shift
		;;

		# Copy files instead of making links
		-c|--copy)
			OP="cp -rf"
			LINK=false
			shift
		;;

		# Overwrite vimrc without making a backup
		-f|--force)
			FORCE=true
			shift
		;;

		-h|--help)
			echo "Usage: vimconfig.sh [[-c|--copy]|[-l|--link] [-f|--force]"
			echo "Options:"
			echo "  -c, --copy          Copy configuration files instead of symlinking"
			echo "  -l, --link          Symlink configuration files from this checkout"
			echo "  -f, --force         Overwrite files without making backups"
			shift
		;;

		*)
			echo unknown argument \"$key\"
			shift
		;;
	esac
done

# Configure vim components, one by one:
# - create/replace ~/.vimrc file
# - configure themes/fonts
# - install vim plugins

# Backup old ~/.vimrc if it already exists
if [ -f ~/.vimrc ] || [ -L ~/.vimrc ]; then
	if [ $FORCE = false ]; then
		dupcount=0
		while [ -e ~/.vimrc.old$dupcount ]; do
			let dupcount++
		done
		mv ~/.vimrc ~/.vimrc.old$dupcount
	fi
fi
$OP "$DIR/configs/vim/vimrc" ~/.vimrc

# Configure vim colors
mkdir -p ~/.vim/colors
$OP "$DIR/configs/vim/apprentice.vim" ~/.vim/colors/apprentice.vim 2>/dev/null

# Install plugins
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
fi

# Configure vim airline theme
$OP "$DIR/configs/vim/airline_bubblegum.vim" ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/bubblegum.vim 2>/dev/null

# Configure vim syntax coloring
for d in "syntax" "after/syntax"; do
	mkdir -p ~/.vim/$d
	for i in "$DIR/configs/vim/$d/*"; do
		i=$(basename $i)
		if [ -e ~/.vim/$d/$i ] && [ ! $FORCE ]; then
			echo "~/.vim/$d/$i already exists; use -f or --force to overwrite" >&2
			exit 1
		fi
		$OP "$DIR/configs/vim/$d/$i" ~/.vim/$d/$i 2>/dev/null
	done
done

exit 0

