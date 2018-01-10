#!/usr/bin/env bash
#
# setup_tmux.sh 
# Copyright (c) 2017 owl
#

ROOT=$( cd "$( dirname "$0" )" && pwd )

# ----- tmux -----
# Latest release: https://github.com/vim/vim.git
git clone https://github.com/vim/vim.git vim-8
cd vim-8

CONFIG="./configure"

case "$OSTYPE" in
	solaris*) echo "Solaris not supported" ;;
	darwin*)
		#CONFIG=$CONFIG "--with-python-config-dir=/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config/"
		CONFIG=$CONFIG" --with-python-config-dir=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config/"
		CONFIG=$CONFIG" --with-python3-config-dir=/opt/local/Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/config-3.6m-darwin/"
		echo "macOS"
		;; 
	linux*)   echo "Linux not supported" ;;
	bsd*)     echo "BSD" ;;
	msys*)    echo "Windows" ;;
	*)        echo "Unknown OS: $OSTYPE" ;;
esac

CONFIG=$CONFIG" --prefix=$(realpath $ROOT/../shell/)/"
CONFIG=$CONFIG" --with-features=huge"
CONFIG=$CONFIG" --enable-pythoninterp=yes"
CONFIG=$CONFIG" --enable-python3interp=yes"
CONFIG=$CONFIG" --enable-cscope=yes"
CONFIG=$CONFIG" --enable-xterm-clipboard=yes"
#CONFIG=$CONFIG" --enable-xterm=yes"

./configure $CONFIG
make -j 4
make install

cd ..

